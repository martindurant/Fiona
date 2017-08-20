
cdef extern from "geos_c.h":
    ctypedef void *GEOSContextHandle_t
    ctypedef struct GEOSGeometry
    ctypedef struct GEOSWKBReader

cdef GEOSGeometry * buffer_to_geom(GEOSContextHandle_t geos_context_handle, GEOSWKBReader* reader)
cdef int ogr_to_buffer(void* geom)
