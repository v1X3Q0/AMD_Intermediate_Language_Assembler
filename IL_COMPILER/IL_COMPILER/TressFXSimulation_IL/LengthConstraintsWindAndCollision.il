il_cs_2_0
dcl_global_flags refactoringAllowed
dcl_cb cb0[10]
dcl_cb cb3[6]
dcl_cb cb5[6]
dcl_resource_id(0)_type(buffer)_fmtx(float)_fmty(float)_fmtz(float)_fmtw(float)
dcl_struct_uav_id(0) 16
dcl_struct_uav_id(1) 16
dcl_struct_uav_id(6) 80
dcl_struct_lds_id(0) 16, 64
dcl_struct_lds_id(1) 4, 64
dcl_num_thread_per_group 64, 1, 1 
dcl_literal l0, 0x00000040, 0x00000040, 0x00000040, 0x00000040
udiv r0.x___, l0, cb0[9].x
umod r0._y__, vTidInGrpFlat0.x, cb0[9].x
imad r0.__z_, vThreadGrpId0.x, cb0[9].x, r0.y
dcl_literal l1, 0x00000001, 0x00000001, 0x00000001, 0x00000001
iadd r0.___w, cb0[9].y, l1
imul r0.__z_, r0.z, r0.w
iadd r0.___w, vTidInGrpFlat0.x, r0.y_neg(xyzw)
udiv r0.___w, r0.w, cb0[9].x
imad r1.x___, r0.z, r0.x, r0.w
dcl_literal l2, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4105.x___, r1.x
mov r4105._y__, l2
uav_struct_load_id(0) r2, r4105.xyxx
dcl_literal l3, 0x00000000, 0x00000000, 0x00000000, 0x00000000
lds_store_vec_id(0) mem0, vTidInGrpFlat0.x, l3, r2
load_resource(0)_sampler(0) r4106, r1.x
mov r1._y__, r4106.yxzw
dcl_literal l4, 0x00000000, 0x00000000, 0x00000000, 0x00000000
lds_store_vec_id(1) mem0.x___, vTidInGrpFlat0.x, l4, r1.y
fence_threads_lds
dcl_literal l5, 0x00000000, 0x00000000, 0x00000000, 0x00000000
ne r1._yzw, cb0[0].xxyz, l5
ior r1._y__, r1.z, r1.y
ior r1._y__, r1.w, r1.y
if_logicalnz r1.y
    dcl_literal l6, 0x00000002, 0x00000002, 0x00000002, 0x00000002
    uge r1._y__, r0.w, l6
    dcl_literal l7, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
    iadd r1.__z_, r0.x, l7
    ult r1.__z_, r0.w, r1.z
    iand r1._y__, r1.z, r1.y
    if_logicalnz r1.y
        dcl_literal l8, 0x00000014, 0x00000014, 0x00000014, 0x00000014
        umod r1._y__, r0.z, l8
        utof r1._y__, r1.y
        dcl_literal l9, 0x3D4CCCCD, 0x3D4CCCCD, 0x3D4CCCCD, 0x3D4CCCCD
        mul_ieee r1.__z_, r1.y, l9
        dcl_literal l10, 0x3D4CCCCD, 0x3D4CCCCD, 0x3D4CCCCD, 0x3D4CCCCD
        dcl_literal l11, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
        mad_ieee r1._y__, r1.y_neg(xyzw), l10, l11
        mul_ieee r3.xyz_, r1.y, cb0[1].xyzx
        mad_ieee r3.xyz_, r1.z, cb0[0].xyzx, r3.xyzx
        mad_ieee r3.xyz_, r1.z, cb0[2].xyzx, r3.xyzx
        mad_ieee r1._yzw, r1.y, cb0[3].xxyz, r3.xxyz
        imad r3.x___, r0.w, cb0[9].x, r0.y
        dcl_literal l12, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_load_vec_id(0) r4108.xyz_, r3.x, l12
        mov r3._yzw, r4108.xxyz
        iadd r4.x___, r3.x, cb0[9].x
        dcl_literal l13, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_load_vec_id(0) r4109.xyz_, r4.x, l13
        mov r4.xyz_, r4109.xyzx
        add r4.xyz_, r3.zwyz, r4.yzxy_neg(xyzw)
        mul_ieee r5.xyz_, r1.yzwy, r4.xyzx
        mad_ieee r1._yzw, r4.zzxy, r1.zzwy, r5.xxyz_neg(xyzw)
        mul_ieee r5.xyz_, r4.xyzx, r1.yzwy
        mad_ieee r1._yzw, r1.wwyz, r4.yyzx, r5.xxyz_neg(xyzw)
        mul_ieee r4.x___, cb0[4].w, cb0[4].w
        mad_ieee r1._yzw, r4.x, r1.yyzw_neg(xyzw), r3.yyzw
        dcl_literal l14, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_store_vec_id(0) mem0.xyz_, r3.x, l14, r1.yzwy
    endif
endif
fence_threads_lds
utof r1._y__, r0.x
dcl_literal l15, 0x3F000000, 0x3F000000, 0x3F000000, 0x3F000000
mul_ieee r1._y__, r1.y, l15
round_neginf r1._y__, r1.y
ftou r1._y__, r1.y
dcl_literal l16, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
iadd r0.x___, r0.x, l16
utof r0.x___, r0.x
dcl_literal l17, 0x3F000000, 0x3F000000, 0x3F000000, 0x3F000000
mul_ieee r0.x___, r0.x, l17
round_neginf r0.x___, r0.x
ftou r0.x___, r0.x
dcl_literal l18, 0x00000001, 0x00000001, 0x00000001, 0x00000001
ishl r1.__z_, r0.w, l18
imad r0._y__, r1.z, cb0[9].x, r0.y
ult r1._y__, r0.w, r1.y
ult r0.x___, r0.w, r0.x
iadd r0.___w, r0.y, cb0[9].x
dcl_literal l19, 0x00000001, 0x00000001, 0x00000001, 0x00000001
ishl r1.__z_, cb0[9].x, l19
iadd r1.__z_, r0.y, r1.z
dcl_literal l20, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r1.___w, l20
whileloop
    ige r3.x___, r1.w, cb0[4].x
    break_logicalnz r3.x
    if_logicalnz r1.y
        dcl_literal l21, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_load_vec_id(0) r3, r0.y, l21
        dcl_literal l22, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_load_vec_id(0) r4, r0.w, l22
        dcl_literal l23, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_load_vec_id(1) r4110.x___, r0.y, l23
        mov r5.x___, r4110.x
        add r5._yzw, r3.xxyz_neg(xyzw), r4.xxyz
        dp3_ieee r6.x___, r5.yzwy, r5.yzwy
        sqrt_vec r6.x___, r6.x
        dcl_literal l24, 0x33D6BF95, 0x33D6BF95, 0x33D6BF95, 0x33D6BF95
        max_ieee r6.x___, r6.x, l24
        div_zeroop(infinity) r5.x___, r5.x, r6.x
        dcl_literal l25, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
        add r5.x___, r5.x_neg(xyzw), l25
        mul_ieee r5.xyz_, r5.yzwy, r5.x
        dcl_literal l26, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lt r3.___w, l26, r3.w
        dcl_literal l27, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lt r4.___w, l27, r4.w
        dcl_literal l28, 0x3F000000, 0x3F000000, 0x00000000, 0x00000000
        dcl_literal l29, 0x3F800000, 0x00000000, 0x00000000, 0x00000000
        cmov_logical r6.xy__, r4.w, l28, l29
        dcl_literal l30, 0x00000000, 0x00000000, 0x00000000, 0x3F800000
        iand r6.__zw, r4.w, l30
        cmov_logical r6.xy__, r3.w, r6.xyxx, r6.zwzz
        mad_ieee r3.xyz_, r6.x, r5.xyzx, r3.xyzx
        mad_ieee r4.xyz_, r6.y_neg(xyzw), r5.xyzx, r4.xyzx
        dcl_literal l31, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_store_vec_id(0) mem0.xyz_, r0.y, l31, r3.xyzx
        dcl_literal l32, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_store_vec_id(0) mem0.xyz_, r0.w, l32, r4.xyzx
    endif
    fence_threads_lds
    if_logicalnz r0.x
        dcl_literal l33, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_load_vec_id(0) r3, r0.w, l33
        dcl_literal l34, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_load_vec_id(0) r4, r1.z, l34
        dcl_literal l35, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_load_vec_id(1) r4111.x___, r0.w, l35
        mov r5.x___, r4111.x
        add r5._yzw, r3.xxyz_neg(xyzw), r4.xxyz
        dp3_ieee r6.x___, r5.yzwy, r5.yzwy
        sqrt_vec r6.x___, r6.x
        dcl_literal l36, 0x33D6BF95, 0x33D6BF95, 0x33D6BF95, 0x33D6BF95
        max_ieee r6.x___, r6.x, l36
        div_zeroop(infinity) r5.x___, r5.x, r6.x
        dcl_literal l37, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
        add r5.x___, r5.x_neg(xyzw), l37
        mul_ieee r5.xyz_, r5.yzwy, r5.x
        dcl_literal l38, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lt r3.___w, l38, r3.w
        dcl_literal l39, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lt r4.___w, l39, r4.w
        dcl_literal l40, 0x3F000000, 0x3F000000, 0x00000000, 0x00000000
        dcl_literal l41, 0x3F800000, 0x00000000, 0x00000000, 0x00000000
        cmov_logical r6.xy__, r4.w, l40, l41
        dcl_literal l42, 0x00000000, 0x00000000, 0x00000000, 0x3F800000
        iand r6.__zw, r4.w, l42
        cmov_logical r6.xy__, r3.w, r6.xyxx, r6.zwzz
        mad_ieee r3.xyz_, r6.x, r5.xyzx, r3.xyzx
        mad_ieee r4.xyz_, r6.y_neg(xyzw), r5.xyzx, r4.xyzx
        dcl_literal l43, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_store_vec_id(0) mem0.xyz_, r0.w, l43, r3.xyzx
        dcl_literal l44, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_store_vec_id(0) mem0.xyz_, r1.z, l44, r4.xyzx
    endif
    fence_threads_lds
    dcl_literal l45, 0x00000001, 0x00000001, 0x00000001, 0x00000001
    iadd r1.___w, r1.w, l45
endloop
dcl_literal l46, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4113.x___, r1.x
mov r4113._y__, l46
uav_struct_load_id(1) r4112.xyz_, r4113.xyxx
mov r0.xy_w, r4112.xyxz
dcl_literal l47, 0x00000000, 0x00000000, 0x00000000, 0x00000000
ilt r1._y__, l47, cb0[4].y
if_logicalnz r1.y
    if_logicalnz cb5[5].x
        mov r3.x___, cb5[0].x
        mov r3._y__, cb5[1].x
        mov r3.__z_, cb5[2].x
        mov r3.___w, cb5[3].x
        mov r4.x___, cb5[0].y
        mov r4._y__, cb5[1].y
        mov r4.__z_, cb5[2].y
        mov r4.___w, cb5[3].y
        mov r5.x___, cb5[0].z
        mov r5._y__, cb5[1].z
        mov r5.__z_, cb5[2].z
        mov r5.___w, cb5[3].z
    else
        dcl_literal l48, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        mov r4115.x___, r0.z
        mov r4115._y__, l48
        uav_struct_load_id(6) r4114.xyz_, r4115.xyxx
        mov r1._yzw, r4114.xxyz
        dcl_literal l49, 0x00000010, 0x00000010, 0x00000010, 0x00000010
        mov r4117.x___, r0.z
        mov r4117._y__, l49
        uav_struct_load_id(6) r4116.xyz_, r4117.xyxx
        mov r6.xyz_, r4116.xyzx
        dcl_literal l50, 0x00000020, 0x00000020, 0x00000020, 0x00000020
        mov r4119.x___, r0.z
        mov r4119._y__, l50
        uav_struct_load_id(6) r4118.xyz_, r4119.xyxx
        mov r7.xyz_, r4118.xyzx
        dcl_literal l51, 0x00000030, 0x00000030, 0x00000030, 0x00000030
        mov r4121.x___, r0.z
        mov r4121._y__, l51
        uav_struct_load_id(6) r4120.xyz_, r4121.xyxx
        mov r5.xy_w, r4120.xyxz
        mov r3.x___, r1.y
        mov r3._y__, r6.x
        mov r3.__z_, r7.x
        mov r3.___w, r5.x
        mov r4.x___, r1.z
        mov r4._y__, r6.y
        mov r4.__z_, r7.y
        mov r4.___w, r5.y
        mov r5.x___, r1.w
        mov r5._y__, r6.z
        mov r5.__z_, r7.z
    endif
    dcl_literal l52, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    lds_load_vec_id(0) r4122.xyz_, vTidInGrpFlat0.x, l52
    mov r6.xyz_, r4122.xyzx
    dcl_literal l53, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    lt r0.__z_, l53, r2.w
    if_logicalnz r0.z
        mov r7.xyz_, cb3[0].xyzx
        dcl_literal l54, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
        mov r7.___w, l54
        dp4_ieee r8.x___, r7, r3
        dp4_ieee r8._y__, r7, r4
        dp4_ieee r8.__z_, r7, r5
        mov r7.xyz_, cb3[1].xyzx
        dcl_literal l55, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
        mov r7.___w, l55
        dp4_ieee r9.x___, r7, r3
        dp4_ieee r9._y__, r7, r4
        dp4_ieee r9.__z_, r7, r5
        add r1._yzw, r8.xxyz_neg(xyzw), r9.xxyz
        add r7.xyz_, r6.xyzx, r8.xyzx_neg(xyzw)
        dp3_ieee r7.___w, r7.xyzx, r1.yzwy
        dcl_literal l56, 0x3A83126F, 0x3A83126F, 0x3A83126F, 0x3A83126F
        lt r8.___w, r7.w, l56
        dp3_ieee r9.___w, r7.xyzx, r7.xyzx
        lt r10.___w, r9.w, cb3[1].w
        rsq_vec r9.___w, r9.w
        mul_ieee r7.xyz_, r7.xyzx, r9.w
        mad_ieee r7.xyz_, cb3[0].w, r7.xyzx, r8.xyzx
        cmov_logical r10.xyz_, r10.w, r7.xyzx, r6.xyzx
        dcl_literal l57, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        mov r6.___w, l57
        cmov_logical r10, r8.w, r10.wxyz, r6.wxyz
        if_logicalz r8.w
            add r7.xyz_, r6.xyzx_neg(xyzw), r9.xyzx
            dp3_ieee r6.___w, r7.xyzx, r1.yzwy
            dcl_literal l58, 0x00000000, 0x00000000, 0x00000000, 0x00000000
            lt r8.___w, r6.w, l58
            dp3_ieee r9.___w, r7.xyzx, r7.xyzx
            lt r11.___w, r9.w, cb3[1].w
            dp3_ieee r9.___w, r7.xyzx_neg(xyzw), r7.xyzx_neg(xyzw)
            rsq_vec r9.___w, r9.w
            mul_ieee r7.xyz_, r7.xyzx_neg(xyzw), r9.w
            mad_ieee r7.xyz_, cb3[0].w, r7.xyzx, r9.xyzx
            cmov_logical r11.xyz_, r11.w, r7.xyzx, r10.yzwy
            cmov_logical r7.xyz_, r8.w, r11.xyzx, r10.yzwy
            mul_ieee r8.xyz_, r8.xyzx, r6.w
            mad_ieee r8.xyz_, r7.w, r9.xyzx, r8.xyzx
            add r6.___w, r6.w, r7.w
            div_zeroop(infinity) r8.xyz_, r8.xyzx, r6.w
            add r8.xyz_, r6.xyzx, r8.xyzx_neg(xyzw)
            dp3_ieee r6.___w, r8.xyzx, r8.xyzx
            lt r9.___w, r6.w, cb3[1].w
            rsq_vec r6.___w, r6.w
            mul_ieee r12.xyz_, r6.w, r8.xyzx
            add r13.xyz_, r0.xywx_neg(xyzw), r6.xyzx
            dp3_ieee r6.___w, r1.yzwy, r1.yzwy
            rsq_vec r6.___w, r6.w
            mul_ieee r1._yzw, r1.yyzw, r6.w
            dp3_ieee r6.___w, r13.xyzx, r1.yzwy
            mul_ieee r14.xyz_, r1.yzwy, r6.w
            mad_ieee r1._yzw, r6.w_neg(xyzw), r1.yyzw, r13.xxyz
            dcl_literal l59, 0x3ECCCCCD, 0x3ECCCCCD, 0x3ECCCCCD, 0x00000000
            mad_ieee r13.xyz_, r14.xyzx, l59, r0.xywx
            mad_ieee r1._yzw, cb3[0].w, r12.xxyz, r1.yyzw
            add r1._yzw, r8.xxyz_neg(xyzw), r1.yyzw
            add r1._yzw, r1.yyzw, r13.xxyz
            cmov_logical r9.xyz_, r9.w, r1.yzwy, r7.xyzx
            cmov_logical r10, r8.w, r11.wxyz, r9.wxyz
            mov r6.xyz_, r10.yzwy
        else
            mov r6.xyz_, r10.yzwy
        endif
    else
        dcl_literal l60, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        mov r10.x___, l60
    endif
    if_logicalnz r10.x
        dcl_literal l61, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_store_vec_id(0) mem0.xyz_, vTidInGrpFlat0.x, l61, r6.xyzx
    endif
    dcl_literal l62, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    lds_load_vec_id(0) r4123.xyz_, vTidInGrpFlat0.x, l62
    mov r6.xyz_, r4123.xyzx
    if_logicalnz r0.z
        mov r7.xyz_, cb3[2].xyzx
        dcl_literal l63, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
        mov r7.___w, l63
        dp4_ieee r8.x___, r7, r3
        dp4_ieee r8._y__, r7, r4
        dp4_ieee r8.__z_, r7, r5
        mov r7.xyz_, cb3[3].xyzx
        dcl_literal l64, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
        mov r7.___w, l64
        dp4_ieee r9.x___, r7, r3
        dp4_ieee r9._y__, r7, r4
        dp4_ieee r9.__z_, r7, r5
        add r1._yzw, r8.xxyz_neg(xyzw), r9.xxyz
        add r7.xyz_, r6.xyzx, r8.xyzx_neg(xyzw)
        dp3_ieee r7.___w, r7.xyzx, r1.yzwy
        dcl_literal l65, 0x3A83126F, 0x3A83126F, 0x3A83126F, 0x3A83126F
        lt r8.___w, r7.w, l65
        dp3_ieee r9.___w, r7.xyzx, r7.xyzx
        lt r11.___w, r9.w, cb3[3].w
        rsq_vec r9.___w, r9.w
        mul_ieee r7.xyz_, r7.xyzx, r9.w
        mad_ieee r7.xyz_, cb3[2].w, r7.xyzx, r8.xyzx
        cmov_logical r11.xyz_, r11.w, r7.xyzx, r6.xyzx
        dcl_literal l66, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        mov r6.___w, l66
        cmov_logical r11, r8.w, r11.wxyz, r6.wxyz
        if_logicalz r8.w
            add r7.xyz_, r6.xyzx_neg(xyzw), r9.xyzx
            dp3_ieee r6.___w, r7.xyzx, r1.yzwy
            dcl_literal l67, 0x00000000, 0x00000000, 0x00000000, 0x00000000
            lt r8.___w, r6.w, l67
            dp3_ieee r9.___w, r7.xyzx, r7.xyzx
            lt r12.___w, r9.w, cb3[3].w
            dp3_ieee r9.___w, r7.xyzx_neg(xyzw), r7.xyzx_neg(xyzw)
            rsq_vec r9.___w, r9.w
            mul_ieee r7.xyz_, r7.xyzx_neg(xyzw), r9.w
            mad_ieee r7.xyz_, cb3[2].w, r7.xyzx, r9.xyzx
            cmov_logical r12.xyz_, r12.w, r7.xyzx, r11.yzwy
            cmov_logical r7.xyz_, r8.w, r12.xyzx, r11.yzwy
            mul_ieee r8.xyz_, r8.xyzx, r6.w
            mad_ieee r8.xyz_, r7.w, r9.xyzx, r8.xyzx
            add r6.___w, r6.w, r7.w
            div_zeroop(infinity) r8.xyz_, r8.xyzx, r6.w
            add r8.xyz_, r6.xyzx, r8.xyzx_neg(xyzw)
            dp3_ieee r6.___w, r8.xyzx, r8.xyzx
            lt r9.___w, r6.w, cb3[3].w
            rsq_vec r6.___w, r6.w
            mul_ieee r10._yzw, r6.w, r8.xxyz
            add r13.xyz_, r0.xywx_neg(xyzw), r6.xyzx
            dp3_ieee r6.___w, r1.yzwy, r1.yzwy
            rsq_vec r6.___w, r6.w
            mul_ieee r1._yzw, r1.yyzw, r6.w
            dp3_ieee r6.___w, r13.xyzx, r1.yzwy
            mul_ieee r14.xyz_, r1.yzwy, r6.w
            mad_ieee r1._yzw, r6.w_neg(xyzw), r1.yyzw, r13.xxyz
            dcl_literal l68, 0x3ECCCCCD, 0x3ECCCCCD, 0x3ECCCCCD, 0x00000000
            mad_ieee r13.xyz_, r14.xyzx, l68, r0.xywx
            mad_ieee r1._yzw, cb3[2].w, r10.yyzw, r1.yyzw
            add r1._yzw, r8.xxyz_neg(xyzw), r1.yyzw
            add r1._yzw, r1.yyzw, r13.xxyz
            cmov_logical r9.xyz_, r9.w, r1.yzwy, r7.xyzx
            cmov_logical r11, r8.w, r12.wxyz, r9.wxyz
            mov r6.xyz_, r11.yzwy
        else
            mov r6.xyz_, r11.yzwy
        endif
    else
        dcl_literal l69, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        mov r11.x___, l69
    endif
    if_logicalnz r11.x
        dcl_literal l70, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_store_vec_id(0) mem0.xyz_, vTidInGrpFlat0.x, l70, r6.xyzx
    endif
    ior r1._y__, r10.x, r11.x
    dcl_literal l71, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    lds_load_vec_id(0) r4124.xyz_, vTidInGrpFlat0.x, l71
    mov r6.xyz_, r4124.xyzx
    if_logicalnz r0.z
        mov r7.xyz_, cb3[4].xyzx
        dcl_literal l72, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
        mov r7.___w, l72
        dp4_ieee r8.x___, r7, r3
        dp4_ieee r8._y__, r7, r4
        dp4_ieee r8.__z_, r7, r5
        mov r7.xyz_, cb3[5].xyzx
        dcl_literal l73, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
        mov r7.___w, l73
        dp4_ieee r3.x___, r7, r3
        dp4_ieee r3._y__, r7, r4
        dp4_ieee r3.__z_, r7, r5
        add r4.xyz_, r8.xyzx_neg(xyzw), r3.xyzx
        add r5.xyz_, r6.xyzx, r8.xyzx_neg(xyzw)
        dp3_ieee r0.__z_, r5.xyzx, r4.xyzx
        dcl_literal l74, 0x3A83126F, 0x3A83126F, 0x3A83126F, 0x3A83126F
        lt r1.__z_, r0.z, l74
        dp3_ieee r1.___w, r5.xyzx, r5.xyzx
        lt r7.___w, r1.w, cb3[5].w
        rsq_vec r1.___w, r1.w
        mul_ieee r5.xyz_, r1.w, r5.xyzx
        mad_ieee r5.xyz_, cb3[4].w, r5.xyzx, r8.xyzx
        cmov_logical r7.xyz_, r7.w, r5.xyzx, r6.xyzx
        dcl_literal l75, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        mov r6.___w, l75
        cmov_logical r5, r1.z, r7.wxyz, r6.wxyz
        if_logicalz r1.z
            add r7.xyz_, r6.xyzx_neg(xyzw), r3.xyzx
            dp3_ieee r1.__z_, r7.xyzx, r4.xyzx
            dcl_literal l76, 0x00000000, 0x00000000, 0x00000000, 0x00000000
            lt r1.___w, r1.z, l76
            dp3_ieee r3.___w, r7.xyzx, r7.xyzx
            lt r9.___w, r3.w, cb3[5].w
            dp3_ieee r3.___w, r7.xyzx_neg(xyzw), r7.xyzx_neg(xyzw)
            rsq_vec r3.___w, r3.w
            mul_ieee r7.xyz_, r3.w, r7.xyzx_neg(xyzw)
            mad_ieee r7.xyz_, cb3[4].w, r7.xyzx, r3.xyzx
            cmov_logical r9.xyz_, r9.w, r7.xyzx, r5.yzwy
            cmov_logical r7.xyz_, r1.w, r9.xyzx, r5.yzwy
            mul_ieee r8.xyz_, r8.xyzx, r1.z
            mad_ieee r3.xyz_, r0.z, r3.xyzx, r8.xyzx
            add r0.__z_, r0.z, r1.z
            div_zeroop(infinity) r3.xyz_, r3.xyzx, r0.z
            add r3.xyz_, r3.xyzx_neg(xyzw), r6.xyzx
            dp3_ieee r0.__z_, r3.xyzx, r3.xyzx
            lt r8.___w, r0.z, cb3[5].w
            rsq_vec r0.__z_, r0.z
            mul_ieee r10.xyz_, r0.z, r3.xyzx
            add r11.xyz_, r0.xywx_neg(xyzw), r6.xyzx
            dp3_ieee r0.__z_, r4.xyzx, r4.xyzx
            rsq_vec r0.__z_, r0.z
            mul_ieee r4.xyz_, r0.z, r4.xyzx
            dp3_ieee r0.__z_, r11.xyzx, r4.xyzx
            mul_ieee r12.xyz_, r4.xyzx, r0.z
            mad_ieee r4.xyz_, r0.z_neg(xyzw), r4.xyzx, r11.xyzx
            dcl_literal l77, 0x3ECCCCCD, 0x3ECCCCCD, 0x3ECCCCCD, 0x00000000
            mad_ieee r0.xyz_, r12.xyzx, l77, r0.xywx
            mad_ieee r4.xyz_, cb3[4].w, r10.xyzx, r4.xyzx
            add r3.xyz_, r3.xyzx_neg(xyzw), r4.xyzx
            add r0.xyz_, r0.xyzx, r3.xyzx
            cmov_logical r8.xyz_, r8.w, r0.xyzx, r7.xyzx
            cmov_logical r5, r1.w, r9.wxyz, r8.wxyz
            mov r6.xyz_, r5.yzwy
        else
            mov r6.xyz_, r5.yzwy
        endif
    else
        dcl_literal l78, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        mov r5.x___, l78
    endif
    if_logicalnz r5.x
        dcl_literal l79, 0x00000000, 0x00000000, 0x00000000, 0x00000000
        lds_store_vec_id(0) mem0.xyz_, vTidInGrpFlat0.x, l79, r6.xyzx
    endif
    ior r0.x___, r1.y, r5.x
else
    dcl_literal l80, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r0.x___, l80
endif
fence_threads_lds
dcl_literal l81, 0x00000000, 0x00000000, 0x00000000, 0x00000000
lds_load_vec_id(0) r4125.xyz_, vTidInGrpFlat0.x, l81
mov r2.xyz_, r4125.xyzx
dcl_literal l82, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4126.x___, r1.x
mov r4126._y__, l82
uav_struct_store_id(0) mem0.xyz_, r4126.xyxx, r2.xyzx
if_logicalnz r0.x
    dcl_literal l83, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4127.x___, r1.x
    mov r4127._y__, l83
    uav_struct_store_id(1) mem0, r4127.xyxx, r2
endif
ret_dyn
end
