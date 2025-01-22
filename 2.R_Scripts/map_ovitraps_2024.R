

# Step 1.1 load ovitraps (2012-2019)
#load("~/Library/CloudStorage/OneDrive-Personal/automatic_read_ovitraps/8.RData/ovitraps/ovitraps_2012_2019_for_encript.RData")

# Step 1. load ovitraps (2021-2024)
load("~/Library/CloudStorage/OneDrive-Personal/automatic_read_ovitraps/8.RData/ovitraps/ovitraps_2021_2024_for_encript.RData")

x  <- x |>
    dplyr::mutate(year = lubridate::year(date)) |>
    dplyr::filter(year == 2024) |>
    dplyr::mutate(cve_edo = stringr::str_sub(clave,
                                             start = 1,
                                             end = 2),
                  cve_mpo = stringr::str_sub(clave,
                                             start = 1,
                                             end = 5),
                  cve_loc = stringr::str_sub(clave,
                                             start = 1,
                                             end = 9))

# Step 2. load the iter loc ####
load("~/Library/CloudStorage/OneDrive-Personal/automatic_read_iter/8.RData/iter_2020_loc.RData")
iter_2020_loc <- iter_2020_loc |>
        dplyr::select(entidad,nom_ent,  mun,
                      nom_mun, loc,  nom_loc,
                      longitud, latitud, altitud,
                      pobtot)

# Step 3. left joint ####
den2016_2024_coordinates <- dplyr::left_join(x = ,
                                             y = den2016_2024,
                                             by = c("entidad" = "CVE_EDO_REP",
                                                    "mun" = "CVE_MPO_REP",
                                                    "loc" = "CVE_LOC_REP")) 

den2016_2024_coordinates [is.na(den2016_2024_coordinates )] <- 0


    
