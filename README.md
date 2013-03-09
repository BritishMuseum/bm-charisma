# bm-workspaces: a set of nip2 workspaces for technical imaging

This set of workspaces are for working with technical images of museum
objects. They are useful for colour calibration, preparation of false-colour
images, and calibration of fluorescence images. 

### Acknowledgements

The development of these workspaces was funded by The British Museum under 
the EU CHARISMA programme. They were developed by Joanne Dyer, Giovanni Verri
and John Cupitt. 

### Import

For these workspace to work well, you need to take care importing images from 
your camera. The workspaces assume that the ICC profile attached to the image
will not apply a tone curve.

In PhotoShop, turn off everything you can, and select no tone curve. 

You can import with rawtherapee like this:

	$ rawtherapee -p rawtherapee-import-params.pp3 -t -c *.CR2

where rawtherapee-import-params.pp3 is in this directory. 

### Installing nip2

nip2 is the GUI of the vips image processing system. You can [download the
program](http://www.vips.ecs.soton.ac.uk/supported/current) from the vips
website.

There are versions for Windows and OS X. On Linux, start your package manager
and search for "nip2".

# Colour calibration with calibrate.ws

Use workspace calibrate.ws to perform visible-light colour calibration of one
image or a set of images.

# False-colour images with false-colour.

Use workspace false-colour.ws to prepare UV or IR false-colour images.

# UV-fluorescence images with uvlumcalib.ws

Use this workspace to calibrate UV-induced fluorescence images. The workspace
can use the Kubelka-Munk colour-mixing equations to generate fluorescence-only
images. 



