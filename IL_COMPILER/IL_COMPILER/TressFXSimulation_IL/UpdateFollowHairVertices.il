il_cs_2_0
dcl_global_flags refactoringAllowed
dcl_cb cb0[10]
dcl_resource_id(3)_type(buffer)_fmtx(float)_fmty(float)_fmtz(float)_fmtw(float)
dcl_struct_uav_id(0) 16
dcl_num_thread_per_group 64, 1, 1 
dcl_literal l0, 0x00000040, 0x00000040, 0x00000040, 0x00000040
udiv r0.x___, l0, cb0[9].x
umod r0._y__, vTidInGrpFlat0.x, cb0[9].x
imad r0.__z_, vThreadGrpId0.x, cb0[9].x, r0.y
dcl_literal l1, 0x00000001, 0x00000001, 0x00000001, 0x00000001
iadd r0.___w, cb0[9].y, l1
imul r1.x___, r0.z, r0.w
iadd r0._y__, vTidInGrpFlat0.x, r0.y_neg(xyzw)
udiv r0._y__, r0.y, cb0[9].x
imad r1.x___, r1.x, r0.x, r0.y
dcl_literal l2, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4106.x___, r1.x
mov r4106._y__, l2
uav_struct_load_id(0) r4105.xyz_, r4106.xyxx
mov r1._yzw, r4105.xxyz
utof r0._y__, r0.y
utof r2.x___, r0.x
div_zeroop(infinity) r0._y__, r0.y, r2.x
dcl_literal l3, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
mad_ieee r0._y__, cb0[9].z, r0.y, l3
dcl_literal l4, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r2.x___, l4
whileloop
    uge r2._y__, r2.x, cb0[9].y
    break_logicalnz r2.y
    dcl_literal l5, 0x00000001, 0x00000001, 0x00000001, 0x00000001
    iadd r2._y__, r2.x, l5
    imad r2.__z_, r0.x, r2.y, r1.x
    imad r2.___w, r0.z, r0.w, r2.x
    dcl_literal l6, 0x00000001, 0x00000001, 0x00000001, 0x00000001
    iadd r2.___w, r2.w, l6
    load_resource(3)_sampler(0) r3.xyz_, r2.w
    mad_ieee r3.xyz_, r0.y, r3.xyzx, r1.yzwy
    dcl_literal l7, 0x00000000, 0x00000000, 0x00000000, 0x00000000
    mov r4108.x___, r2.z
    mov r4108._y__, l7
    uav_struct_store_id(0) mem0.xyz_, r4108.xyxx, r3.xyzx
    mov r2.x___, r2.y
endloop
ret_dyn
end
