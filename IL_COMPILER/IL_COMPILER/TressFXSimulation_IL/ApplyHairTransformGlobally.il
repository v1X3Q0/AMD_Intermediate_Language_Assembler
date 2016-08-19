il_cs_2_0
dcl_global_flags refactoringAllowed
dcl_cb cb0[10]
dcl_cb cb5[6]
dcl_struct_uav_id(0) 16
dcl_struct_uav_id(1) 16
dcl_struct_uav_id(3) 16
dcl_struct_uav_id(6) 80
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
imad r0.x___, r0.z, r0.x, r0.y
dcl_literal l2, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4105.x___, r0.x
mov r4105._y__, l2
uav_struct_load_id(0) r1, r4105.xyxx
dcl_literal l3, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4106.x___, r0.x
mov r4106._y__, l3
uav_struct_load_id(3) r2, r4106.xyxx
if_logicalnz cb5[5].x
    mul_ieee r3.xyz_, r2.y, cb5[1].xyzx
    mad_ieee r3.xyz_, r2.x, cb5[0].xyzx, r3.xyzx
    mad_ieee r3.xyz_, r2.z, cb5[2].xyzx, r3.xyzx
    add r2.xyz_, r3.xyzx, cb5[3].xyzx
else
    dcl_literal l4, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4108.x___, r0.z
    mov r4108._y__, l4
    uav_struct_load_id(6) r4107.xyz_, r4108.xyxx
    mov r3.xyz_, r4107.xyzx
    dcl_literal l5, 0x00000010, 0x00000010, 0x00000010, 0x00000010
    mov r4110.x___, r0.z
    mov r4110._y__, l5
    uav_struct_load_id(6) r4109.xyz_, r4110.xyxx
    mov r4.xyz_, r4109.xyzx
    dcl_literal l6, 0x00000020, 0x00000020, 0x00000020, 0x00000020
    mov r4112.x___, r0.z
    mov r4112._y__, l6
    uav_struct_load_id(6) r4111.xyz_, r4112.xyxx
    mov r5.xyz_, r4111.xyzx
    dcl_literal l7, 0x00000030, 0x00000030, 0x00000030, 0x00000030
    mov r4114.x___, r0.z
    mov r4114._y__, l7
    uav_struct_load_id(6) r4113.xyz_, r4114.xyxx
    mov r6.xy_w, r4113.xyxz
    mov r7.xyz_, r2.xyzx
    dcl_literal l8, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
    mov r7.___w, l8
    mov r8.x___, r3.x
    mov r8._y__, r4.x
    mov r8.__z_, r5.x
    mov r8.___w, r6.x
    dp4_ieee r2.x___, r7, r8
    mov r8.x___, r3.y
    mov r8._y__, r4.y
    mov r8.__z_, r5.y
    mov r8.___w, r6.y
    dp4_ieee r2._y__, r7, r8
    mov r6.x___, r3.z
    mov r6._y__, r4.z
    mov r6.__z_, r5.z
    dp4_ieee r2.__z_, r7, r6
endif
dcl_literal l9, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4115.x___, r0.x
mov r4115._y__, l9
uav_struct_store_id(1) mem0, r4115.xyxx, r1
dcl_literal l10, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4116.x___, r0.x
mov r4116._y__, l10
uav_struct_store_id(0) mem0, r4116.xyxx, r2
ret_dyn
end
