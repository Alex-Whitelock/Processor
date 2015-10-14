/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000309137412_0159392871_init();
    work_m_00000000000469771556_3623513560_init();
    work_m_00000000003481755444_1452727384_init();
    work_m_00000000000031667893_2955069016_init();
    work_m_00000000002275592129_2154807560_init();
    work_m_00000000003404611168_2354930975_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003404611168_2354930975");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
