#!/usr/bin/env python

import sys, traceback
import cv2
import os
import re
import numpy as np
import argparse
import string
import plantcv as pcv


def options():
    parser = argparse.ArgumentParser(description="Imaging processing with OpenCV")
    parser.add_argument("-i", "--image", help="Input image file.", required=True)
    parser.add_argument("-o", "--outdir", help="Output directory for image files.", required=False)
    parser.add_argument("-r", "--result", help="result file.", required=False)
    parser.add_argument("-w", "--writeimg", help="write out images.", default=False, action="store_true")
    parser.add_argument("-D", "--debug", help="Turn on debug, prints intermediate images.", action=None)
    args = parser.parse_args()
    return args


### Main pipeline
def main():
    # Get options
    args = options()

    # Change labels
    debug = args.debug
    image = args.image

    # Read VIS image
    img, path, filename = pcv.readimage(args.image)

    # Pipeline step
    device = 0

    # White balance
    device, corr_img = pcv.white_balance(device, img, debug, [1450, 400, 5, 5])
	# Modify the 4 numbers in square brackets to draw a square that rests on a white color card, or white color marker.

    # Convert RBG to Grey using Blue-Yellow Channel 
	device, b = pcv.rgb2gray_lab(corr_img, 'b', device, debug)
	# Channel 'b' should make the plant brighter over background. Otherwise, use a different channel. 

    # Gaussian blur
	device, g_blur = pcv.gaussian_blur(device, b, (5,5), 0, None, debug)

    # Threshold the blue image
    device, img_thresh = pcv.triangle_auto_threshold(device, g_blur, 255, 'light', 20, args.debug)
    device, img_cnt = pcv.triangle_auto_threshold(device, g_blur, 255, 'light', 20, args.debug)
	# Modify the number 20 in both lines to an appropriate threshold that best separates plant from background

    # Fill small objects
    device, img_fill = pcv.fill(img_thresh, img_cnt, 50, device, args.debug)
	# Modify the number 50 to what best fills holes in the plant (white) and background (black)

    # Mask white-balanced image (here, based on blue channel)
	device, masked = pcv.apply_mask(corr_img, b_fill, 'white', device, debug)

    # Identify objects
    device, id_objects, obj_hierarchy = pcv.find_objects(masked, img_fill, device, args.debug)

    # Define region of interest
	device, roi1, roi_hierarchy = pcv.define_roi(masked, 'rectangle', device, None, 'default', debug, True, 
                                             1000, 10, -1000, -300)
	# Modify the 4 numbers in the parenthesis to draw a square that surrounds or overlaps the entire plant, 
	# but does not surround or overlap background.

    # Decide which objects to keep
    device, roi_objects, hierarchy3, kept_mask, obj_area = pcv.roi_objects(corr_img, 'partial', roi1, roi_hierarchy,
                                                                           id_objects, obj_hierarchy, device,
                                                                           args.debug)
    # Object combine kept objects
    device, obj, mask = pcv.object_composition(img, roi_objects, hierarchy3, device, args.debug)

    ############## Analysis ################

    outfile = False
    if args.writeimg == True:
        outfile = args.outdir + "/" + filename

    # Find shape properties, output shape image (optional)
    device, shape_header, shape_data, shape_img = pcv.analyze_object(img, args.image, obj, mask, device, args.debug,
                                                                     outfile)

    # Shape properties relative to user boundary line (optional)
    device, boundary_header, boundary_data, boundary_img1 = pcv.analyze_bound(img, args.image, obj, mask, 90, device,
                                                                              args.debug, outfile)

    # Determine color properties: Histograms, Color Slices and Pseudo-colored Images; output color analyzed images (optional)
    device, color_header, color_data, color_img = pcv.analyze_color(img, args.image, mask, 256, device, args.debug,
                                                                    None, 'v', 'img', 300, outfile)

    # Output shape and color data
    result = open(args.result, "a")
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
    result.write('\t'.join(map(str, boundary_header)))
    result.write("\n")
    result.write('\t'.join(map(str, boundary_data)))
    result.write("\n")
    result.write('\t'.join(map(str, boundary_img1)))
    result.write("\n")
    for row in color_img:
        result.write('\t'.join(map(str, row)))
        result.write("\n")
    result.close()


if __name__ == '__main__':
    main()