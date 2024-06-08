# RGB Plotclip GeoJSON
This script clips GeoTIF images to plots using a shapefile/GeoJSON.

## Inputs
The script requires GeoTIF image/s and a GeoJSON, both in the same coordinate system.

## Outputs
The script ouputs subdirectories for each plot in the GeoJSON with plot clipped GeoTIFs in each.

## Arguments and Flags
* **Positional Arguments:** 
    * **TIF file to clip:** 'tif', nargs='+' 
* **Required Arguments:**
    * **Sensor used to collect images:** '-sen', '--sensor'
    * **GeoJSON with plot polygons:** '-shp', '--shape'             
* **Optional Arguments:**
    * **Output directory:** '-o', '--outdir', default='plotclip_out'
    * **Coordinate system of images:** '-e', '--epsg', default=4326
