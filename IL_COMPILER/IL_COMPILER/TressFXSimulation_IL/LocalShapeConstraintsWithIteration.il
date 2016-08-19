il_cs_2_0
dcl_global_flags refactoringAllowed
dcl_cb cb0[10]
dcl_cb cb5[6]
dcl_resource_id(1)_type(buffer)_fmtx(sint)_fmty(sint)_fmtz(sint)_fmtw(sint)
dcl_resource_id(2)_type(buffer)_fmtx(float)_fmty(float)_fmtz(float)_fmtw(float)
dcl_struct_uav_id(0) 16
dcl_struct_uav_id(4) 16
dcl_struct_uav_id(6) 80
dcl_indexed_temp_array x0[16]
dcl_num_thread_per_group 64, 1, 1 
dcl_literal l0, 0x00000040, 0x00000040, 0x00000040, 0x00000040
imad r0.x___, vThreadGrpId0.x, l0, vTidInGrpFlat0.x
dcl_literal l1, 0x00000001, 0x00000001, 0x00000001, 0x00000001
iadd r0._y__, cb0[9].y, l1
imul r0.x___, r0.x, r0.y
dcl_literal l2, 0x00000040, 0x00000040, 0x00000040, 0x00000040
udiv r0._y__, l2, cb0[9].x
load_resource(1)_sampler(0) r4105, r0.x
mov r0.__z_, r4105.yzxw
imul r0.___w, r0.x, r0.y
dcl_literal l3, 0x00000002, 0x00000003, 0x00000001, 0x00000000
ieq r1.xyz_, r0.z, l3
dcl_literal l4, 0x3ECCCCCD, 0x3ECCCCCD, 0x3ECCCCCD, 0x3ECCCCCD
cmov_logical r0.__z_, r0.z, l4, cb0[5].y
cmov_logical r0.__z_, r1.z, cb0[6].y, r0.z
cmov_logical r0.__z_, r1.y, cb0[8].y, r0.z
cmov_logical r0.__z_, r1.x, cb0[7].y, r0.z
dcl_literal l5, 0x3F733333, 0x3F733333, 0x3F733333, 0x3F733333
min_ieee r0.__z_, r0.z, l5
dcl_literal l6, 0x3F000000, 0x3F000000, 0x3F000000, 0x3F000000
mul_ieee r0.__z_, r0.z, l6
dcl_literal l7, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r1.x___, l7
whileloop
    uge r1._y__, r1.x, r0.y
    break_logicalnz r1.y
    imad r1._y__, r0.x, r0.y, r1.x
    dcl_literal l8, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4107.x___, r1.y
    mov r4107._y__, l8
    uav_struct_load_id(0) r2, r4107.xyxx
    mov x0[r1.x], r2
    dcl_literal l9, 0x00000001, 0x00000001, 0x00000001, 0x00000001
    iadd r1.x___, r1.x, l9
endloop
dcl_literal l10, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
iadd r1.x___, r0.y, l10
dcl_literal l11, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r1._y__, l11
whileloop
    uge r1.__z_, r1.y, cb0[9].w
    break_logicalnz r1.z
    mov r2, x0[1]
    dcl_literal l12, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4108.x___, r0.w
    mov r4108._y__, l12
    uav_struct_load_id(4) r3, r4108.xyxx
    mov r4, r3
    mov r5.xyz_, r2.xyzx
    mov r1.__z_, r2.w
    dcl_literal l13, 0x00000001, 0x00000001, 0x00000001, 0x00000001
    mov r1.___w, l13
    whileloop
        uge r5.___w, r1.w, r1.x
        break_logicalnz r5.w
        imad r5.___w, r0.x, r0.y, r1.w
        dcl_literal l14, 0x00000001, 0x00000001, 0x00000001, 0x00000001
        iadd r6.x___, r1.w, l14
        mov r7, x0[r6.x]
        if_logicalnz cb5[5].x
            mul_ieee r6._y__, r4.x, cb5[4].x
            mad_ieee r6._y__, cb5[4].w, r4.w, r6.y_neg(xyzw)
            mad_ieee r6._y__, cb5[4].y_neg(xyzw), r4.y, r6.y
            mad_ieee r8.___w, cb5[4].z_neg(xyzw), r4.z, r6.y
            dp3_ieee r6._y__, cb5[4].wyxw, r4.xzwx
            mad_ieee r8.x___, cb5[4].z_neg(xyzw), r4.y, r6.y
            dp3_ieee r6._y__, cb5[4].zwyz, r4.xywx
            mad_ieee r8._y__, cb5[4].x_neg(xyzw), r4.z, r6.y
            dp3_ieee r6._y__, cb5[4].xwzx, r4.yzwy
            mad_ieee r8.__z_, cb5[4].y_neg(xyzw), r4.x, r6.y
        else
            dcl_literal l15, 0x00000040, 0x00000040, 0x00000040, 0x00000040
            mov r4109.x___, r0.x
            mov r4109._y__, l15
            uav_struct_load_id(6) r9, r4109.xyxx
            mul_ieee r6._y__, r4.x, r9.x
            mad_ieee r6._y__, r9.w, r4.w, r6.y_neg(xyzw)
            mad_ieee r6._y__, r9.y_neg(xyzw), r4.y, r6.y
            mad_ieee r8.___w, r9.z_neg(xyzw), r4.z, r6.y
            dp3_ieee r6._y__, r9.wyxw, r4.xzwx
            mad_ieee r8.x___, r9.z_neg(xyzw), r4.y, r6.y
            dp3_ieee r6._y__, r9.zwyz, r4.xywx
            mad_ieee r8._y__, r9.x_neg(xyzw), r4.z, r6.y
            dp3_ieee r6._y__, r9.xwzx, r4.yzwy
            mad_ieee r8.__z_, r9.y_neg(xyzw), r4.x, r6.y
        endif
        dcl_literal l16, 0x00000001, 0x00000001, 0x00000001, 0x00000001
        iadd r5.___w, r5.w, l16
        load_resource(2)_sampler(0) r4110, r5.w
        mov r6._yzw, r4110.wxyz
        mul_ieee r9.xyz_, r6.zwyz, r8.zxyz
        mad_ieee r9.xyz_, r8.yzxy, r6.wyzw, r9.xyzx_neg(xyzw)
        mul_ieee r10.xyz_, r8.zxyz, r9.yzxy
        mad_ieee r10.xyz_, r8.yzxy, r9.zxyz, r10.xyzx_neg(xyzw)
        add r5.___w, r8.w, r8.w
        mad_ieee r6._yzw, r9.xxyz, r5.w, r6.yyzw
        dcl_literal l17, 0x00000000, 0x40000000, 0x40000000, 0x40000000
        mad_ieee r6._yzw, r10.xxyz, l17, r6.yyzw
        add r6._yzw, r5.xxyz, r6.yyzw
        add r6._yzw, r7.xxyz_neg(xyzw), r6.yyzw
        dcl_literal l18, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lt r5.___w, l18, r1.z
        mad_ieee r9.xyz_, r0.z_neg(xyzw), r6.yzwy, r5.xyzx
        cmov_logical r9.xyz_, r5.w, r9.xyzx, r5.xyzx
        dcl_literal l19, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lt r5.___w, l19, r7.w
        mad_ieee r6._yzw, r0.z, r6.yyzw, r7.xxyz
        cmov_logical r5.xyz_, r5.w, r6.yzwy, r7.xyzx
        dp4_ieee r5.___w, r8, r8
        dcl_literal l20, 0x3A83126F, 0x3A83126F, 0x3A83126F, 0x3A83126F
        ge r6._y__, r5.w, l20
        div_zeroop(infinity) r10.xyz_, r8.xyzx_neg(xyzw), r5.w
        div_zeroop(infinity) r10.___w, r8.w, r5.w
        dcl_literal l21, 0x00000000, 0x00000000, 0x00000000, 0x3F800000
        cmov_logical r8, r6.y, r10, l21
        add r10, r9.xyzx_neg(xyzw), r5.xyzx
        dp3_ieee r5.___w, r10.yzwy, r10.yzwy
        rsq_vec r5.___w, r5.w
        mul_ieee r10, r5.w, r10
        mul_ieee r11, r8.zxyz, r10.yzwy
        mad_ieee r11, r8.yzxy, r10.zwyz, r11_neg(xyzw)
        mul_ieee r12, r8.zxyz, r11.yzwy
        mad_ieee r12, r8.yzxy, r11.zwyz, r12_neg(xyzw)
        add r5.___w, r8.w, r8.w
        mad_ieee r8, r11, r5.w, r10
        dcl_literal l22, 0x40000000, 0x40000000, 0x40000000, 0x40000000
        mad_ieee r8, r12, l22, r8
        dp3_ieee r5.___w, r8.yzwy, r8.yzwy
        rsq_vec r5.___w, r5.w
        mul_ieee r8, r5.w, r8
        dcl_literal l23, 0x00000000, 0x3F800000, 0x00000000, 0x00000000
        mul_ieee r6._yz_, r8.zzwz, l23
        dcl_literal l24, 0x00000000, 0x3F800000, 0x3F800000, 0x00000000
        mad_ieee r10, r8.xyyx, l24, r6.yzzy_neg(xyzw)
        dp2_ieee r5.___w, r10.zwzz, r10.zwzz
        sqrt_vec r6._y__, r5.w
        dcl_literal l25, 0x3A83126F, 0x3A83126F, 0x3A83126F, 0x3A83126F
        lt r6._y__, l25, r6.y
        dcl_literal l26, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
        add r6.__z_, r8.w_neg(xyzw)_abs, l26
        sqrt_vec r6.__z_, r6.z
        dcl_literal l27, 0xBC996E30, 0xBC996E30, 0xBC996E30, 0xBC996E30
        dcl_literal l28, 0x3D981627, 0x3D981627, 0x3D981627, 0x3D981627
        mad_ieee r6.___w, r8.w_abs, l27, l28
        dcl_literal l29, 0xBE593484, 0xBE593484, 0xBE593484, 0xBE593484
        mad_ieee r6.___w, r6.w, r8.w_abs, l29
        dcl_literal l30, 0x3FC90DA4, 0x3FC90DA4, 0x3FC90DA4, 0x3FC90DA4
        mad_ieee r6.___w, r6.w, r8.w_abs, l30
        mul_ieee r7.x___, r6.z, r6.w
        dcl_literal l31, 0xC0000000, 0xC0000000, 0xC0000000, 0xC0000000
        dcl_literal l32, 0x40490FDB, 0x40490FDB, 0x40490FDB, 0x40490FDB
        mad_ieee r7.x___, r7.x, l31, l32
        lt r7._y__, r8.w, r8.w_neg(xyzw)
        iand r7.x___, r7.y, r7.x
        mad_ieee r6.__z_, r6.w, r6.z, r7.x
        rsq_vec r5.___w, r5.w
        mul_ieee r8, r5.w, r10
        dcl_literal l33, 0x3F000000, 0x3F000000, 0x3F000000, 0x3F000000
        mul_ieee r5.___w, r6.z, l33
        sin_vec r4112, r5.w
        cos_vec r10.x___, r5.w
        mov r7.x___, r4112
        mul_ieee r8, r8, r7.x
        mul_ieee r6.__zw, r4.y, r8.wwwz
        mad_ieee r5.___w, r4.w, r10.x, r6.z_neg(xyzw)
        mad_ieee r11.___w, r4.z_neg(xyzw), r8.z, r5.w
        mad_ieee r5.___w, r4.x, r10.x, r6.w
        mad_ieee r11.x___, r4.z_neg(xyzw), r8.w, r5.w
        mul_ieee r6.__zw, r4.w, r8.xxxz
        mad_ieee r6.__zw, r4.yyyz, r10.x, r6.zzzw
        mad_ieee r11._y__, r4.x_neg(xyzw), r8.y, r6.z
        mad_ieee r11.__z_, r4.x, r8.w, r6.w
        cmov_logical r4, r6.y, r11, r4
        mov x0[r1.w].xyz_, r9.xyzx
        mov x0[r6.x].xyz_, r5.xyzx
        mov r1.__z_, r7.w
        mov r1.___w, r6.x
    endloop
    dcl_literal l34, 0x00000001, 0x00000001, 0x00000001, 0x00000001
    iadd r1._y__, r1.y, l34
endloop
dcl_literal l35, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r0.__z_, l35
whileloop
    uge r0.___w, r0.z, r0.y
    break_logicalnz r0.w
    imad r0.___w, r0.x, r0.y, r0.z
    mov r1, x0[r0.z]
    dcl_literal l36, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4113.x___, r0.w
    mov r4113._y__, l36
    uav_struct_store_id(0) mem0, r4113.xyxx, r1
    dcl_literal l37, 0x00000001, 0x00000001, 0x00000001, 0x00000001
    iadd r0.__z_, r0.z, l37
endloop
ret_dyn
end
