from __future__ import absolute_import

from fiona cimport ogrext2
include "_geos.pxi"

cdef GEOSGeometry * buffer_to_geom(GEOSContextHandle_t geos_context_handle, GEOSWKBReader* reader):
                 #   uchar* wkb_buff, size_t buffer_size):
    geom = GEOSWKBReader_read_r(geos_context_handle, reader, <unsigned char*>wkb_buff, 50000)
    return geom

cdef char[50000] wkb_buff

cdef int ogr_to_buffer(void* geom):  # this is an OGR geom pointer, not a GEOS one
    cdef int size
    size = ogrext2.OGR_G_WkbSize(geom)
    if size > 50000:
        return -1
    ogrext2.OGR_G_ExportToWkb(geom, 1, wkb_buff)
    return 0