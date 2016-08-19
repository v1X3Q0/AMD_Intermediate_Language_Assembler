il_cs_2_0
dcl_global_flags refactoringAllowed
dcl_cb cb0[10]
dcl_struct_uav_id(0) 16
dcl_struct_uav_id(1) 16
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
imad r0._y__, r0.z, r0.x, r0.y
dcl_literal l2, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r0.__z_, l2
whileloop
    uge r0.___w, r0.z, cb0[9].y
    break_logicalnz r0.w
    dcl_literal l3, 0x00000001, 0x00000001, 0x00000001, 0x00000001
    iadd r0.__z_, r0.z, l3
    imad r0.___w, r0.x, r0.z, r0.y
    dcl_literal l4, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4106.x___, r0.w
    mov r4106._y__, l4
    uav_struct_load_id(0) r4105.xyz_, r4106.xyxx
    mov r1.xyz_, r4105.xyzx
    dcl_literal l5, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4107.x___, r0.w
    mov r4107._y__, l5
    uav_struct_store_id(1) mem0.xyz_, r4107.xyxx, r1.xyzx
endloop
ret_dyn
end
