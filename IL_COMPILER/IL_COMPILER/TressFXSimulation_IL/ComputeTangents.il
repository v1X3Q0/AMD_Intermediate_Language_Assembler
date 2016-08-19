il_cs_2_0
dcl_global_flags refactoringAllowed
dcl_cb cb0[10]
dcl_struct_uav_id(0) 16
dcl_struct_uav_id(2) 16
dcl_struct_lds_id(0) 16, 64
dcl_num_thread_per_group 64, 1, 1 
dcl_literal l0, 0x00000040, 0x00000040, 0x00000040, 0x00000040
udiv r0.x___, l0, cb0[9].x
umod r0._y__, vTidInGrpFlat0.x, cb0[9].x
imad r0.__z_, vThreadGrpId0.x, cb0[9].x, r0.y
iadd r0._y__, vTidInGrpFlat0.x, r0.y_neg(xyzw)
udiv r0._y__, r0.y, cb0[9].x
imad r0.x___, r0.z, r0.x, r0.y
dcl_literal l1, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4106.x___, r0.x
mov r4106._y__, l1
uav_struct_load_id(0) r4105.xyz_, r4106.xyxx
mov r1.xyz_, r4105.xyzx
dcl_literal l2, 0x00000000, 0x00000000, 0x00000000, 0x00000000
lds_store_vec_id(0) mem0.xyz_, vTidInGrpFlat0.x, l2, r1.xyzx
fence_threads_lds
if_logicalz r0.y
    iadd r0._y__, vTidInGrpFlat0.x, cb0[9].x
    dcl_literal l3, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    lds_load_vec_id(0) r4107.xyz_, r0.y, l3
    mov r0._yzw, r4107.xxyz
    add r0._yzw, r1.xxyz_neg(xyzw), r0.yyzw
    dp3_ieee r1.___w, r0.yzwy, r0.yzwy
    rsq_vec r1.___w, r1.w
    mul_ieee r0._yzw, r0.yyzw, r1.w
else
    iadd r1.___w, vTidInGrpFlat0.x, cb0[9].x_neg(xyzw)
    dcl_literal l4, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    lds_load_vec_id(0) r4108.xyz_, r1.w, l4
    mov r2.xyz_, r4108.xyzx
    add r1.xyz_, r1.xyzx, r2.xyzx_neg(xyzw)
    dp3_ieee r1.___w, r1.xyzx, r1.xyzx
    rsq_vec r1.___w, r1.w
    mul_ieee r0._yzw, r1.w, r1.xxyz
endif
dcl_literal l5, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4109.x___, r0.x
mov r4109._y__, l5
uav_struct_store_id(2) mem0.xyz_, r4109.xyxx, r0.yzwy
ret_dyn
end
