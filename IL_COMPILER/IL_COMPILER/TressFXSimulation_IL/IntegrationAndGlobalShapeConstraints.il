il_cs_2_0
dcl_global_flags refactoringAllowed
dcl_cb cb0[10]
dcl_cb cb5[6]
dcl_resource_id(1)_type(buffer)_fmtx(sint)_fmty(sint)_fmtz(sint)_fmtw(sint)
dcl_struct_uav_id(0) 16
dcl_struct_uav_id(1) 16
dcl_struct_uav_id(3) 16
dcl_struct_uav_id(6) 80
dcl_struct_lds_id(0) 16, 64
dcl_num_thread_per_group 64, 1, 1 
dcl_literal l0, 0x00000040, 0x00000040, 0x00000040, 0x00000040
udiv r0.x___, l0, cb0[9].x
umod r0._y__, vTidInGrpFlat0.x, cb0[9].x
imad r0.__z_, vThreadGrpId0.x, cb0[9].x, r0.y
dcl_literal l1, 0x00000001, 0x00000001, 0x00000001, 0x00000001
iadd r0.___w, cb0[9].y, l1
imul r0.__z_, r0.z, r0.w
iadd r0._y__, vTidInGrpFlat0.x, r0.y_neg(xyzw)
udiv r0._y__, r0.y, cb0[9].x
load_resource(1)_sampler(0) r4105, r0.z
mov r0.___w, r4105.yzwx
imad r1.x___, r0.z, r0.x, r0.y
dcl_literal l2, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4107.x___, r1.x
mov r4107._y__, l2
uav_struct_load_id(3) r2, r4107.xyxx
if_logicalnz cb5[5].x
    mul_ieee r1._yzw, r2.y, cb5[1].xxyz
    mad_ieee r1._yzw, r2.x, cb5[0].xxyz, r1.yyzw
    mad_ieee r1._yzw, r2.z, cb5[2].xxyz, r1.yyzw
    add r1._yzw, r1.yyzw, cb5[3].xxyz
else
    dcl_literal l3, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4109.x___, r0.z
    mov r4109._y__, l3
    uav_struct_load_id(6) r4108.xyz_, r4109.xyxx
    mov r3.xyz_, r4108.xyzx
    dcl_literal l4, 0x00000010, 0x00000010, 0x00000010, 0x00000010
    mov r4111.x___, r0.z
    mov r4111._y__, l4
    uav_struct_load_id(6) r4110.xyz_, r4111.xyxx
    mov r4.xyz_, r4110.xyzx
    dcl_literal l5, 0x00000020, 0x00000020, 0x00000020, 0x00000020
    mov r4113.x___, r0.z
    mov r4113._y__, l5
    uav_struct_load_id(6) r4112.xyz_, r4113.xyxx
    mov r5.xyz_, r4112.xyzx
    dcl_literal l6, 0x00000030, 0x00000030, 0x00000030, 0x00000030
    mov r4115.x___, r0.z
    mov r4115._y__, l6
    uav_struct_load_id(6) r4114.xyz_, r4115.xyxx
    mov r6.xy_w, r4114.xyxz
    mov r7.xyz_, r2.xyzx
    dcl_literal l7, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
    mov r7.___w, l7
    mov r8.x___, r3.x
    mov r8._y__, r4.x
    mov r8.__z_, r5.x
    mov r8.___w, r6.x
    dp4_ieee r1._y__, r7, r8
    mov r8.x___, r3.y
    mov r8._y__, r4.y
    mov r8.__z_, r5.y
    mov r8.___w, r6.y
    dp4_ieee r1.__z_, r7, r8
    mov r6.x___, r3.z
    mov r6._y__, r4.z
    mov r6.__z_, r5.z
    dp4_ieee r1.___w, r7, r6
endif
dcl_literal l8, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4116.x___, r1.x
mov r4116._y__, l8
uav_struct_load_id(0) r3, r4116.xyxx
dcl_literal l9, 0x00000000, 0x00000000, 0x00000000, 0x00000000
lds_store_vec_id(0) mem0, vTidInGrpFlat0.x, l9, r3
fence_threads_lds
dcl_literal l10, 0x00000001, 0x00000002, 0x00000003, 0x00000000
ieq r2.xyz_, r0.w, l10
dcl_literal l11, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4118.x___, r1.x
mov r4118._y__, l11
uav_struct_load_id(1) r4117.xyz_, r4118.xyxx
mov r4.xyz_, r4117.xyzx
dcl_literal l12, 0x00000000, 0x00000000, 0x00000000, 0x00000000
lt r0.__z_, l12, r3.w
if_logicalnz r0.z
    dcl_literal l13, 0x3CF5C28F, 0x3CF5C28F, 0x3CF5C28F, 0x3CF5C28F
    cmov_logical r0.__z_, r2.z, cb0[8].x, l13
    cmov_logical r0.__z_, r2.y, cb0[7].x, r0.z
    cmov_logical r0.__z_, r2.x, cb0[6].x, r0.z
    cmov_logical r0.__z_, r0.w, r0.z, cb0[5].x
    mul_ieee r4.___w, cb0[4].w, cb0[4].w
    dcl_literal l14, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
    add r0.__z_, r0.z_neg(xyzw), l14
    add r4.xyz_, r3.xyzx, r4.xyzx_neg(xyzw)
    mad_ieee r4.xyz_, r0.z, r4.xyzx, r3.xyzx
    mul_ieee r0.__z_, r4.w, cb0[4].z
    dcl_literal l15, 0x00000000, 0xBF800000, 0x00000000, 0x00000000
    mad_ieee r4.xyz_, r0.z, l15, r4.xyzx
else
    dcl_literal l16, 0x0000000C, 0x0000000C, 0x0000000C, 0x0000000C
    lds_store_vec_id(0) mem0.x___, vTidInGrpFlat0.x, l16, r2.w
    mov r4.xyz_, r1.yzwy
endif
dcl_literal l17, 0x00000000, 0x00000000, 0x00000000, 0x00000000
lds_store_vec_id(0) mem0.xyz_, vTidInGrpFlat0.x, l17, r4.xyzx
iand r2.__zw, r2.z, cb0[8].zzzw
cmov_logical r2._yz_, r2.y, cb0[7].zzwz, r2.zzwz
cmov_logical r2.xy__, r2.x, cb0[6].zwzz, r2.yzyy
cmov_logical r0.__zw, r0.w, r2.xxxy, cb0[5].zzzw
dcl_literal l18, 0x00000000, 0x00000000, 0x00000000, 0x00000000
lt r2.x___, l18, r0.z
dcl_literal l19, 0x00000000, 0x00000000, 0x00000000, 0x00000000
ne r2._y__, l19, r0.w
iand r2.x___, r2.y, r2.x
if_logicalnz r2.x
    dcl_literal l20, 0x0000000C, 0x0000000C, 0x0000000C, 0x0000000C
    lds_load_vec_id(0) r4119.x___, vTidInGrpFlat0.x, l20
    mov r2.x___, r4119.x
    dcl_literal l21, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    lt r2.x___, l21, r2.x
    if_logicalnz r2.x
        utof r0.xy__, r0.xyxx
        mul_ieee r0.x___, r0.x, r0.w
        lt r0.x___, r0.y, r0.x
        if_logicalnz r0.x
            add r0.xy_w, r1.yzyw, r4.xyxz_neg(xyzw)
            mad_ieee r0.xyz_, r0.z, r0.xywx, r4.xyzx
            dcl_literal l22, 0x00000000, 0x00000000, 0x00000000, 0x00000000
            lds_store_vec_id(0) mem0.xyz_, vTidInGrpFlat0.x, l22, r0.xyzx
        endif
    endif
endif
dcl_literal l23, 0x00000000, 0x00000000, 0x00000000, 0x00000000
lds_load_vec_id(0) r0, vTidInGrpFlat0.x, l23
dcl_literal l24, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4120.x___, r1.x
mov r4120._y__, l24
uav_struct_store_id(1) mem0, r4120.xyxx, r3
dcl_literal l25, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4121.x___, r1.x
mov r4121._y__, l25
uav_struct_store_id(0) mem0, r4121.xyxx, r0
ret_dyn
end
