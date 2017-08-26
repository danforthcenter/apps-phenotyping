#!/usr/bin/env python

import os
import posixpath
import re
import string
import sys
import traceback
sys.path.append('/Users/mgehan/Documents/github/plantcv/')
import argparse
import cv2
import numpy as np
import plantcv as pcv


def options():
    parser = argparse.ArgumentParser(description="Imaging processing with opencv")
    parser.add_argument("-i", "--image", help="Input image file.", required=True)
    parser.add_argument("-o", "--outdir", help="Output directory for image files.", required=True)
    parser.add_argument("-D", "--debug", help="Turn on debug, prints intermediate images.", default=None)
    parser.add_argument("-w", "--writeimg", help="Write out images to file.", action="store_true")
    args = parser.parse_args()
    return args


def main():
    # Sets variables from input arguments
    args = options()

    device = 0  # Workflow step counter
    debug = args.debug  # Option to display debug images to the notebook
    vis_img = args.image  # Name of seed Image
    writeimg = args.writeimg
    outdir = str(args.outdir)

    # Read image
    img, path, filename = pcv.readimage(vis_img)

    # White balance image based on white toughspot
    device, img1 = pcv.white_balance(device, img, debug, (400, 150, 200, 200))

    # Converts RGB to HSV and thresholds
    device, l = pcv.rgb2gray_hsv(img1, 's', device, debug)
    device, l_thresh = pcv.binary_threshold(l, 24, 255, 'light', device, debug)

	# Modify the number to fill in noise.
    l_cnt = np.copy(l_thresh)
    device, l_cnt1 = pcv.fill(l_thresh, l_cnt, 24, device, debug)

    # Identifies objects using filled binary image as a mask
    device, id_objects, obj_hierarchy = pcv.find_objects(img1, l_cnt1, device, debug)

    # Defines rectangular region of interest (ROI)
    device, roi1, roi_hierarchy = pcv.define_roi(img1, 'rectangle', device, None, 'default', debug, True, 1300, 850,
                                                 -1000, -620)

    # Keeps only objects within or partially within ROI
    device, roi_objects, roi_obj_hierarchy, kept_mask, obj_area = pcv.roi_objects(img1, 'partial', roi1, roi_hierarchy,
                                                                                  id_objects, obj_hierarchy, device,
                                                                                  debug)

    # Finds the area of the size marker in pixels and saves to "marker data"
    device, marker_header, marker_data, analysis_images = \
        pcv.report_size_marker_area(img1, 'rectangle', device, debug, "detect", 3850, 660, -200, -2080, "white",
                                    "light", "s", 24, False)

    x = 0
    for i in range(0, len(roi_objects)):
        if roi_obj_hierarchy[0][i][3] == -1:  # Checks if shape is a parent contour

            # Object combine kept objects
            device, obj, mask2 = pcv.object_composition(img1, [roi_objects[i]], np.array([[roi_obj_hierarchy[0][i]]]),
                                                        device, debug)
            if obj is not None:
                device, shape_header, shape_data, shape_img = \
                    pcv.analyze_object(img1, vis_img, obj, mask2, device, debug)
                device, color_header, color_data, color_img = \
                    pcv.analyze_color(img1, vis_img, mask2, 256, device, debug, None, 'v', 'img', 300, filename=False)
                if shape_data is not None:
                    x+=1
                    prefix = str(outdir)+"/"+ str(filename[0:-4])+"_result"
                    result = open(str(prefix) + '_' + str(x) + '.txt', 'a')
                    result.write('\t'.join(map(str, shape_header)))
                    result.write("\n")
                    result.write('\t'.join(map(str, shape_data)))
                    result.write("\n")
                    for row in shape_img:
                        result.write('\t'.join(map(str, row)))
                        result.write("\n")
                    result.write('\t'.join(map(str, color_header)))
                    result.write("\n")
                    result.write('\t'.join(map(str, color_data)))
                    result.write("\n")
                    for row in color_img:
                        result.write('\t'.join(map(str, row)))
                        result.write("\n")
                    result.write('\t'.join(map(str, marker_header)))
                    result.write("\n")
                    result.write('\t'.join(map(str, marker_data)))
                    result.write("\n")
                    for row in analysis_images:
                        result.write('\t'.join(map(str, row)))
                        result.write("\n")
                    result.close()


if __name__ == '__main__':
  main()