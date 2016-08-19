il_cs_2_0
dcl_global_flags refactoringAllowed
dcl_cb cb0[10]
dcl_cb cb5[6]
dcl_resource_id(1)_type(buffer)_fmtx(sint)_fmty(sint)_fmtz(sint)_fmtw(sint)
dcl_resource_id(2)_type(buffer)_fmtx(float)_fmty(float)_fmtz(float)_fmtw(float)
dcl_struct_uav_id(0) 16
dcl_struct_uav_id(4) 16
dcl_struct_uav_id(6) 80
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
dcl_literal l7, 0x00000001, 0x00000001, 0x00000001, 0x00000001
imad r1.x___, r0.x, r0.y, l7
dcl_literal l8, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4107.x___, r1.x
mov r4107._y__, l8
uav_struct_load_id(0) r1, r4107.xyxx
dcl_literal l9, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4108.x___, r0.w
mov r4108._y__, l9
uav_struct_load_id(4) r2, r4108.xyxx
dcl_literal l10, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
iadd r0.___w, r0.y, l10
mov r3, r2
mov r4, r1
dcl_literal l11, 0x00000001, 0x00000001, 0x00000001, 0x00000001
mov r5.x___, l11
whileloop
    uge r5._y__, r5.x, r0.w
    break_logicalnz r5.y
    imad r5._y__, r0.x, r0.y, r5.x
    dcl_literal l12, 0x00000001, 0x00000001, 0x00000001, 0x00000001
    iadd r5.__z_, r5.y, l12
    dcl_literal l13, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4109.x___, r5.z
    mov r4109._y__, l13
    uav_struct_load_id(0) r6, r4109.xyxx
    if_logicalnz cb5[5].x
        mul_ieee r5.___w, r3.x, cb5[4].x
        mad_ieee r5.___w, cb5[4].w, r3.w, r5.w_neg(xyzw)
        mad_ieee r5.___w, cb5[4].y_neg(xyzw), r3.y, r5.w
        mad_ieee r7.___w, cb5[4].z_neg(xyzw), r3.z, r5.w
        dp3_ieee r5.___w, cb5[4].wyxw, r3.xzwx
        mad_ieee r7.x___, cb5[4].z_neg(xyzw), r3.y, r5.w
        dp3_ieee r5.___w, cb5[4].zwyz, r3.xywx
        mad_ieee r7._y__, cb5[4].x_neg(xyzw), r3.z, r5.w
        dp3_ieee r5.___w, cb5[4].xwzx, r3.yzwy
        mad_ieee r7.__z_, cb5[4].y_neg(xyzw), r3.x, r5.w
    else
        dcl_literal l14, 0x00000040, 0x00000040, 0x00000040, 0x00000040
        mov r4110.x___, r0.x
        mov r4110._y__, l14
        uav_struct_load_id(6) r8, r4110.xyxx
        mul_ieee r5.___w, r3.x, r8.x
        mad_ieee r5.___w, r8.w, r3.w, r5.w_neg(xyzw)
        mad_ieee r5.___w, r8.y_neg(xyzw), r3.y, r5.w
        mad_ieee r7.___w, r8.z_neg(xyzw), r3.z, r5.w
        dp3_ieee r5.___w, r8.wyxw, r3.xzwx
        mad_ieee r7.x___, r8.z_neg(xyzw), r3.y, r5.w
        dp3_ieee r5.___w, r8.zwyz, r3.xywx
        mad_ieee r7._y__, r8.x_neg(xyzw), r3.z, r5.w
        dp3_ieee r5.___w, r8.xwzx, r3.yzwy
        mad_ieee r7.__z_, r8.y_neg(xyzw), r3.x, r5.w
    endif
    load_resource(2)_sampler(0) r8.xyz_, r5.z
    mul_ieee r9.xyz_, r7.zxyz, r8.yzxy
    mad_ieee r9.xyz_, r7.yzxy, r8.zxyz, r9.xyzx_neg(xyzw)
    mul_ieee r10.xyz_, r7.zxyz, r9.yzxy
    mad_ieee r10.xyz_, r7.yzxy, r9.zxyz, r10.xyzx_neg(xyzw)
    add r5.___w, r7.w, r7.w
    mad_ieee r8.xyz_, r9.xyzx, r5.w, r8.xyzx
    dcl_literal l15, 0x40000000, 0x40000000, 0x40000000, 0x00000000
    mad_ieee r8.xyz_, r10.xyzx, l15, r8.xyzx
    add r8.xyz_, r4.xyzx, r8.xyzx
    add r8.xyz_, r6.xyzx_neg(xyzw), r8.xyzx
    dcl_literal l16, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    lt r5.___w, l16, r4.w
    mad_ieee r9.xyz_, r0.z_neg(xyzw), r8.xyzx, r4.xyzx
    cmov_logical r9.xyz_, r5.w, r9.xyzx, r4.xyzx
    dcl_literal l17, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    lt r5.___w, l17, r6.w
    mad_ieee r8.xyz_, r0.z, r8.xyzx, r6.xyzx
    cmov_logical r4.xyz_, r5.w, r8.xyzx, r6.xyzx
    dp4_ieee r5.___w, r7, r7
    dcl_literal l18, 0x3A83126F, 0x3A83126F, 0x3A83126F, 0x3A83126F
    ge r6.x___, r5.w, l18
    div_zeroop(infinity) r8.xyz_, r7.xyzx_neg(xyzw), r5.w
    div_zeroop(infinity) r8.___w, r7.w, r5.w
    dcl_literal l19, 0x00000000, 0x00000000, 0x00000000, 0x3F800000
    cmov_logical r7, r6.x, r8, l19
    add r8, r9.xyzx_neg(xyzw), r4.xyzx
    dp3_ieee r5.___w, r8.yzwy, r8.yzwy
    rsq_vec r5.___w, r5.w
    mul_ieee r8, r5.w, r8
    mul_ieee r10, r7.zxyz, r8.yzwy
    mad_ieee r10, r7.yzxy, r8.zwyz, r10_neg(xyzw)
    mul_ieee r11, r7.zxyz, r10.yzwy
    mad_ieee r11, r7.yzxy, r10.zwyz, r11_neg(xyzw)
    add r5.___w, r7.w, r7.w
    mad_ieee r7, r10, r5.w, r8
    dcl_literal l20, 0x40000000, 0x40000000, 0x40000000, 0x40000000
    mad_ieee r7, r11, l20, r7
    dp3_ieee r5.___w, r7.yzwy, r7.yzwy
    rsq_vec r5.___w, r5.w
    mul_ieee r7, r5.w, r7
    dcl_literal l21, 0x3F800000, 0x00000000, 0x00000000, 0x00000000
    mul_ieee r6.xy__, r7.zwzz, l21
    dcl_literal l22, 0x00000000, 0x3F800000, 0x3F800000, 0x00000000
    mad_ieee r8, r7.xyyx, l22, r6.xyyx_neg(xyzw)
    dp2_ieee r5.___w, r8.zwzz, r8.zwzz
    sqrt_vec r6.x___, r5.w
    dcl_literal l23, 0x3A83126F, 0x3A83126F, 0x3A83126F, 0x3A83126F
    lt r6.x___, l23, r6.x
    dcl_literal l24, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
    add r6._y__, r7.w_neg(xyzw)_abs, l24
    sqrt_vec r6._y__, r6.y
    dcl_literal l25, 0xBC996E30, 0xBC996E30, 0xBC996E30, 0xBC996E30
    dcl_literal l26, 0x3D981627, 0x3D981627, 0x3D981627, 0x3D981627
    mad_ieee r6.__z_, r7.w_abs, l25, l26
    dcl_literal l27, 0xBE593484, 0xBE593484, 0xBE593484, 0xBE593484
    mad_ieee r6.__z_, r6.z, r7.w_abs, l27
    dcl_literal l28, 0x3FC90DA4, 0x3FC90DA4, 0x3FC90DA4, 0x3FC90DA4
    mad_ieee r6.__z_, r6.z, r7.w_abs, l28
    mul_ieee r7.x___, r6.y, r6.z
    dcl_literal l29, 0xC0000000, 0xC0000000, 0xC0000000, 0xC0000000
    dcl_literal l30, 0x40490FDB, 0x40490FDB, 0x40490FDB, 0x40490FDB
    mad_ieee r7.x___, r7.x, l29, l30
    lt r7._y__, r7.w, r7.w_neg(xyzw)
    iand r7.x___, r7.y, r7.x
    mad_ieee r6._y__, r6.z, r6.y, r7.x
    rsq_vec r5.___w, r5.w
    mul_ieee r7, r5.w, r8
    dcl_literal l31, 0x3F000000, 0x3F000000, 0x3F000000, 0x3F000000
    mul_ieee r5.___w, r6.y, l31
    sin_vec r4112, r5.w
    cos_vec r10.x___, r5.w
    mov r8.x___, r4112
    mul_ieee r7, r7, r8.x
    mul_ieee r6._yz_, r3.y, r7.wwzw
    mad_ieee r5.___w, r3.w, r10.x, r6.y_neg(xyzw)
    mad_ieee r8.___w, r3.z_neg(xyzw), r7.z, r5.w
    mad_ieee r5.___w, r3.x, r10.x, r6.z
    mad_ieee r8.x___, r3.z_neg(xyzw), r7.w, r5.w
    mul_ieee r6._yz_, r3.w, r7.xxzx
    mad_ieee r6._yz_, r3.yyzy, r10.x, r6.yyzy
    mad_ieee r8._y__, r3.x_neg(xyzw), r7.y, r6.y
    mad_ieee r8.__z_, r3.x, r7.w, r6.z
    cmov_logical r3, r6.x, r8, r3
    dcl_literal l32, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4113.x___, r5.y
    mov r4113._y__, l32
    uav_struct_store_id(0) mem0.xyz_, r4113.xyxx, r9.xyzx
    dcl_literal l33, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4114.x___, r5.z
    mov r4114._y__, l33
    uav_struct_store_id(0) mem0.xyz_, r4114.xyxx, r4.xyzx
    dcl_literal l34, 0x00000001, 0x00000001, 0x00000001, 0x00000001
    iadd r5.x___, r5.x, l34
    mov r4.___w, r6.w
endloop
ret_dyn
end
