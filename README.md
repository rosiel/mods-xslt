# MODS-XLST Transforms

This repository contains a series of transforms and data to help you transform from MODS XML files to an [Islandora Workbench](https://github.com/mjordan/islandora_workbench) adjacent XML format. 


# Description of the sheets

## Stylesheets

* `mods-extractor.xsl` applies the "baseline" [MIG MODS Mapping](https://docs.google.com/spreadsheets/d/18u2qFJ014IIxlVpM3JXfDEFccwBZcoFsjbBGpvL0jJI/edit#gid=0). 
* `mods-nullifier.xsl` is designed to show you what parts of your metadata are not being picked up by the mods-extractor transform. Applied to a MODS file or folder of MODS files, it first removes all text-less elements that don't have a `valueURI` attribute. Then, it removes all the elements (text nodes and attributes) that were successfully processed by `mods-extractor.xsl`. If you want, you can run `merge.xsl` to combine a folder of output to a single file, and/or `cleanup.xsl` to remove empty tags. After analyzing the results of mods-nullifier this way you may want to add additional templates to `mods-extractor-custom.xsl`.
* `mods-extractor-custom.xsl` is a place for you to enter additional templates that will be used along with those in `mods-extractor.xsl`. This is to separate out the "standard" transform from additional requirements. If you put templates in this file with the same name or selector as the ones in mods-extractor.xsl, they will override the templates in `mods-extractor.xsl`. There is a sample template in `mods-extractor-custom.xsl` to demonstrate its use, but this is meant as a "custom" file so do what you want with it. If you want to iterate and see that all your custom fields are being extracted, write a corresponding template in `mods-nullifier-custom.xsl`.
* `mods-nullifier-custom.xsl` is a place to extend the `mods-nullifier.xsl` stylesheet with additional, or overriding, templates. It's yours to use.

* `merge.xsl` when applied to a folder, creates an output file that merges `<mods>` files into a `<modsCollection>`. 
* `cleanup.xsl` removes truly empty tags (no text or attributes, and no children with text or attributes).

## Data files

* `ISO-639-2.xml` is a mapping between MODS language codes and text.
* `relators.xml` is a mapping between MODS relators codes and text.


# Usage 

TODO: sample script for running saxon from the command line

Read the description of the stylesheets, above. 

Use your favourite XSLT processor (e.g. Oxygen transformation scenario or using Saxon on the command line) to apply `mods-extractor-custom.xsl` to a file or a folder of files. The output is a XML file that contains tags representing fields in a Workbench CSV. (see Future Work section).

Use the same method to apply `mods-nullifier-custom.xsl`. The result is a MODS file with the "extracted" elements removed. 

Read the results and iterate, adding templates as needed to `mods-extractor-custom.xsl` and `mods-nullifier-custom.xsl` as needed for your data. 

# Future Work

Create a Python script to transform the XML to a Workbench CSV.
