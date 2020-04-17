# bm-workspaces: a set of nip2 workspaces for technical imaging

This nip2 workspace is for working with technical images of museum
objects. It is useful for colour calibration, preparation of false-colour
images, and calibration of fluorescence images. 

### Acknowledgements

The development of these workspaces was funded by The British Museum under 
the EU CHARISMA programme. They were developed by Joanne Dyer, Giovanni Verri
and John Cupitt. 

### Import

For this workspace to work well, you need to take care importing images from 
your camera. The workspace assumes that the ICC profile attached to the image
will not apply a tone curve.

In PhotoShop, turn off everything you can, and select no tone curve. 

You can import with rawtherapee like this:

	$ rawtherapee -p rawtherapee-import-params.pp3 -t -c *.CR2

where `rawtherapee-import-params.pp3` is in this directory. 

### Installing nip2

nip2 is the GUI of the vips image processing
system. In April 2020, the current [windows
version](https://github.com/libvips/nip2/releases/download/v8.7.0/nip2-8.7.0-setup.zip)
is 8.7.0 and the current [macos
version](https://github.com/libvips/nip2/releases/download/v8.6.0-beta2/nip2-8.6.0-beta2.app.dmg)
is 8.6.0.

On Linux, start your package manager and search for `nip2`.

### Loading the workspace

Start nip2 and drag `bm-workspaces.ws` into the main window, or alternatively
select File / Open. The workspace needs nip2 8.2 or later. 

There is a manual on how to use the workspace on the British Museum page for
this project:

	http://www.britishmuseum.org/research/research_projects/all_current_projects/charisma/technical_imaging.aspx

### Also here

`charisma-bm-workspace.ws` is an earlier version of the workspace which will
work with older versions of nip2.

`bm-workspaces-perugino.ws` is exactly `bm-workspaces.ws`, but set up to
process a sample set of images of a drawing by Perugino.

`CHANGELOG` lists the changes made to the workspace over the years. 

`TODO` lists a few ideas and issues. 
