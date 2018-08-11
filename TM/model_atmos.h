#ifndef MODEL_ATMOS_H_INCLUDED
#define MODEL_ATMOS_H_INCLUDED
#include <vector>

class model_atmos {
  public:
    static bool get_PT(double kmt, double &hPa, double &K);
    static double get_km(double P, double Punits = units_hPa);
    struct model_row {
      double km;
      double K;
      double hPa;
      double lnhPa;
    };
    static std::vector<model_row> table;
    static const double units_hPa = 1013.25;
    static const double units_Torr = 760;
    static const double units_atm = 1;
};

#endif
