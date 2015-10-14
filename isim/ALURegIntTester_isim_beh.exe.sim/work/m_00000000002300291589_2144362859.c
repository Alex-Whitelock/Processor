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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/u0694842/Desktop/oct14/Processor/ALURegIntTester.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static const char *ng3 = "This is testing";
static int ng4[] = {1, 0};
static unsigned int ng5[] = {17U, 0U};
static unsigned int ng6[] = {1U, 0U};
static unsigned int ng7[] = {5U, 0U};
static unsigned int ng8[] = {2U, 0U};
static unsigned int ng9[] = {3U, 0U};
static unsigned int ng10[] = {4U, 0U};
static unsigned int ng11[] = {6U, 0U};
static unsigned int ng12[] = {7U, 0U};
static unsigned int ng13[] = {8U, 0U};
static unsigned int ng14[] = {9U, 0U};
static unsigned int ng15[] = {10U, 0U};
static unsigned int ng16[] = {11U, 0U};
static unsigned int ng17[] = {12U, 0U};
static unsigned int ng18[] = {13U, 0U};
static unsigned int ng19[] = {14U, 0U};
static unsigned int ng20[] = {15U, 0U};
static unsigned int ng21[] = {16U, 0U};



static void Initial_62_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(62, ng0);

LAB2:    xsi_set_current_line(64, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1608);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 16);
    xsi_set_current_line(65, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1768);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 5);
    xsi_set_current_line(66, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1928);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 5);
    xsi_set_current_line(67, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2088);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 5);
    xsi_set_current_line(68, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2248);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(69, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2408);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(70, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2568);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(71, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2728);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(72, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2888);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 4);
    xsi_set_current_line(73, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3048);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 4);
    xsi_set_current_line(74, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3208);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB1:    return;
}

static void Always_82_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;

LAB0:    t1 = (t0 + 4376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 4944);
    *((int *)t2) = 1;
    t3 = (t0 + 4408);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(83, ng0);

LAB5:    xsi_set_current_line(85, ng0);
    t4 = (t0 + 3208);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t7, 32);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng10)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng11)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng12)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng13)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng14)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng15)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng16)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng17)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng18)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng19)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng20)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB37;

LAB38:    t2 = ((char*)((ng21)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 32, t2, 32);
    if (t8 == 1)
        goto LAB39;

LAB40:
LAB41:    goto LAB2;

LAB7:    xsi_set_current_line(87, ng0);

LAB42:    xsi_set_current_line(88, ng0);
    xsi_vlogfile_write(1, 0, 0, ng3, 1, t0);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2728);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(91, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB9:    xsi_set_current_line(100, ng0);

LAB43:    xsi_set_current_line(101, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(107, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(108, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(109, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB11:    xsi_set_current_line(112, ng0);

LAB44:    xsi_set_current_line(113, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(115, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(117, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(118, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(119, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB13:    xsi_set_current_line(124, ng0);

LAB45:    xsi_set_current_line(125, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(126, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB15:    xsi_set_current_line(137, ng0);

LAB46:    xsi_set_current_line(138, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(139, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(144, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(145, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(146, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB17:    xsi_set_current_line(149, ng0);

LAB47:    xsi_set_current_line(150, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(151, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(152, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(153, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(154, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(157, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(158, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB19:    xsi_set_current_line(161, ng0);

LAB48:    xsi_set_current_line(162, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(164, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(165, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(166, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(167, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(168, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(169, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(170, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB21:    xsi_set_current_line(173, ng0);

LAB49:    xsi_set_current_line(174, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(175, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(176, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(178, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(179, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(180, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(181, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(182, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB23:    xsi_set_current_line(185, ng0);

LAB50:    xsi_set_current_line(186, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(187, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(188, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(189, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(190, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(191, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(192, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(193, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(194, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB25:    xsi_set_current_line(197, ng0);

LAB51:    xsi_set_current_line(198, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(199, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(200, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(201, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(202, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(203, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(204, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(205, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(206, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB27:    xsi_set_current_line(209, ng0);

LAB52:    xsi_set_current_line(210, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(211, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(212, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(213, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(214, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(215, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(216, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(217, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(218, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB29:    xsi_set_current_line(222, ng0);

LAB53:    xsi_set_current_line(223, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(224, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(225, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(226, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(227, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(228, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(229, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(230, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(231, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB31:    xsi_set_current_line(235, ng0);

LAB54:    xsi_set_current_line(236, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(237, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(238, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(239, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(240, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(241, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(242, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(243, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(244, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB33:    xsi_set_current_line(248, ng0);

LAB55:    xsi_set_current_line(249, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(250, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(251, ng0);
    t2 = ((char*)((ng15)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(252, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(253, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(254, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(255, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(256, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(257, ng0);
    t2 = ((char*)((ng19)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB35:    xsi_set_current_line(261, ng0);

LAB56:    xsi_set_current_line(262, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(263, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(264, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(265, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(266, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(267, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(268, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(269, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(270, ng0);
    t2 = ((char*)((ng20)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB37:    xsi_set_current_line(274, ng0);

LAB57:    xsi_set_current_line(275, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(276, ng0);
    t2 = ((char*)((ng19)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(277, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(278, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(279, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(280, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(281, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(282, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(283, ng0);
    t2 = ((char*)((ng21)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

LAB39:    xsi_set_current_line(287, ng0);

LAB58:    xsi_set_current_line(288, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(289, ng0);
    t2 = ((char*)((ng20)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(290, ng0);
    t2 = ((char*)((ng19)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(291, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 5);
    xsi_set_current_line(292, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(293, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(294, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 16);
    xsi_set_current_line(295, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 3048);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(296, ng0);
    t2 = ((char*)((ng21)));
    t3 = (t0 + 3208);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    goto LAB41;

}

static void Always_304_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 4624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(304, ng0);
    t2 = (t0 + 4432);
    xsi_process_wait(t2, 1000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(304, ng0);
    t4 = (t0 + 2568);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 2568);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}


extern void work_m_00000000002300291589_2144362859_init()
{
	static char *pe[] = {(void *)Initial_62_0,(void *)Always_82_1,(void *)Always_304_2};
	xsi_register_didat("work_m_00000000002300291589_2144362859", "isim/ALURegIntTester_isim_beh.exe.sim/work/m_00000000002300291589_2144362859.didat");
	xsi_register_executes(pe);
}
