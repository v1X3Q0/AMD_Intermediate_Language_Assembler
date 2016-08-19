il_cs_2_0
dcl_global_flags refactoringAllowed
dcl_cb cb0[10]
dcl_resource_id(4)_type(buffer)_fmtx(float)_fmty(float)_fmtz(float)_fmtw(float)
dcl_resource_id(5)_type(buffer)_fmtx(float)_fmty(float)_fmtz(float)_fmtw(float)
dcl_struct_srv_id(6) 24
dcl_struct_uav_id(3) 16
dcl_struct_uav_id(6) 80
dcl_num_thread_per_group 64, 1, 1 
dcl_literal l0, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r0.___w, l0
dcl_literal l1, 0x00000040, 0x00000040, 0x00000040, 0x00000040
imad r1.x___, vThreadGrpId0.x, l1, vTidInGrpFlat0.x
dcl_literal l2, 0x00000001, 0x00000001, 0x00000001, 0x00000001
iadd r1._y__, cb0[9].y, l2
imul r1.x___, r1.x, r1.y
dcl_literal l3, 0x00000004, 0x00000004, 0x00000004, 0x00000004
mov r4105.x___, r1.x
mov r4105._y__, l3
srv_struct_load_id(6) r2, r4105.xyxx
dcl_literal l4, 0x00000003, 0x00000003, 0x00000003, 0x00000003
imul r1._y__, r2.x, l4
load_resource(4)_sampler(0) r3.xyz_, r1.y
load_resource(5)_sampler(0) r4107, r1.y
mov r1._yzw, r4107.wxyz
dcl_literal l5, 0x00000003, 0x00000003, 0x00000000, 0x00000000
dcl_literal l6, 0x00000001, 0x00000002, 0x00000000, 0x00000000
imad r4.xy__, r2.x, l5, l6
load_resource(4)_sampler(0) r5.xyz_, r4.y
add r3.xyz_, r3.yzxy, r5.yzxy_neg(xyzw)
dp3_ieee r2.x___, r3.xyzx, r3.xyzx
rsq_vec r2.x___, r2.x
mul_ieee r3.xyz_, r2.x, r3.xyzx
load_resource(4)_sampler(0) r6.xyz_, r4.x
add r5.xyz_, r5.xyzx_neg(xyzw), r6.xyzx
mul_ieee r6.xyz_, r3.xyzx, r5.xyzx
mad_ieee r5.xyz_, r3.zxyz, r5.yzxy, r6.xyzx_neg(xyzw)
dp3_ieee r2.x___, r5.xyzx, r5.xyzx
rsq_vec r2.x___, r2.x
mul_ieee r5.xyz_, r2.x, r5.xzyx
mul_ieee r6.xyz_, r3.xyzx, r5.xzyx
mad_ieee r6.xyz_, r5.yxzy, r3.yzxy, r6.xyzx_neg(xyzw)
dp3_ieee r2.x___, r6.xyzx, r6.xyzx
rsq_vec r2.x___, r2.x
mul_ieee r6.xyz_, r2.x, r6.xyzx
mov r7.__z_, r6.x
load_resource(5)_sampler(0) r4111, r4.x
mov r4.x_zw, r4111.xwyz
load_resource(5)_sampler(0) r8.xyz_, r4.y
add r9.xyz_, r4.xzwx, r8.xyzx_neg(xyzw)
mul_ieee r4.xyz_, r2.z, r4.xzwx
mad_ieee r2.xyz_, r2.y, r1.yzwy, r4.xyzx
add r1._yzw, r1.zzwy, r8.yyzx_neg(xyzw)
mad_ieee r2._yzw, r2.w, r8.xxyz, r2.xxyz
dp3_ieee r3.___w, r1.yzwy, r1.yzwy
rsq_vec r3.___w, r3.w
mul_ieee r1._yzw, r1.yyzw, r3.w
mul_ieee r4.xyz_, r9.xyzx, r1.yzwy
mad_ieee r4.xyz_, r1.wyzw, r9.yzxy, r4.xyzx_neg(xyzw)
dp3_ieee r3.___w, r4.xyzx, r4.xyzx
rsq_vec r3.___w, r3.w
mul_ieee r4.xyz_, r3.w, r4.xzyx
mul_ieee r8.xyz_, r1.yzwy, r4.xzyx
mad_ieee r8.xyz_, r4.yxzy, r1.zwyz, r8.xyzx_neg(xyzw)
dp3_ieee r3.___w, r8.xyzx, r8.xyzx
rsq_vec r3.___w, r3.w
mul_ieee r8.xyz_, r3.w, r8.xyzx
mov r9.__z_, r8.x
mov r7._y__, r5.z
mov r9._y__, r4.z
mov r7.x___, r3.z
mov r9.x___, r1.w
dp3_ieee r10.x___, r7.xyzx, r9.xyzx
mov r0.x___, r10.x
mov r4.__z_, r8.y
mov r8._y__, r4.x
mov r4.x___, r1.y
mov r8.x___, r1.z
dp3_ieee r11.x___, r7.xyzx, r4.xyzx
dp3_ieee r7.x___, r7.xyzx, r8.xyzx
mov r0._y__, r11.x
mov r0.__z_, r7.x
dcl_literal l7, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4114.x___, r1.x
mov r4114._y__, l7
uav_struct_store_id(6) mem0, r4114.xyxx, r0
mov r5.__z_, r6.y
mov r6._y__, r5.x
mov r5.x___, r3.x
mov r6.x___, r3.y
dp3_ieee r10._y__, r5.xyzx, r9.xyzx
dp3_ieee r10.__z_, r6.xyzx, r9.xyzx
mov r3.x___, r10.y
dp3_ieee r11._y__, r5.xyzx, r4.xyzx
dp3_ieee r11.__z_, r6.xyzx, r4.xyzx
dp3_ieee r7.__z_, r6.xyzx, r8.xyzx
dp3_ieee r7._y__, r5.xyzx, r8.xyzx
mov r3._y__, r11.y
mov r3.__z_, r7.y
dcl_literal l8, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r3.___w, l8
dcl_literal l9, 0x00000010, 0x00000010, 0x00000010, 0x00000010
mov r4115.x___, r1.x
mov r4115._y__, l9
uav_struct_store_id(6) mem0, r4115.xyxx, r3
mov r4.x___, r10.z
mov r4._y__, r11.z
mov r4.__z_, r7.z
dcl_literal l10, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4.___w, l10
dcl_literal l11, 0x00000020, 0x00000020, 0x00000020, 0x00000020
mov r4116.x___, r1.x
mov r4116._y__, l11
uav_struct_store_id(6) mem0, r4116.xyxx, r4
dcl_literal l12, 0x00000040, 0x00000040, 0x00000040, 0x00000040
udiv r0._y__, l12, cb0[9].x
imul r0._y__, r1.x, r0.y
dcl_literal l13, 0x00000000, 0x00000000, 0x00000000, 0x00000000
mov r4118.x___, r0.y
mov r4118._y__, l13
uav_struct_load_id(3) r4117.xyz_, r4118.xyxx
mov r0._yzw, r4117.xxyz
dp3_ieee r2.x___, r0.yzwy_neg(xyzw), r10.xyzx
add r0.x___, r0.x, r3.y
dp3_ieee r3.x___, r0.yzwy_neg(xyzw), r11.xyzx
add r1._y__, r11.x_neg(xyzw), r10.y
add r1.__z_, r7.y_neg(xyzw), r11.z
dp3_ieee r3.__z_, r0.yzwy_neg(xyzw), r7.xyzx
add r0._y__, r7.x, r10.z_neg(xyzw)
add r0.x___, r4.z, r0.x
dcl_literal l14, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
add r0.x___, r0.x, l14
sqrt_vec r0.x___, r0.x
dcl_literal l15, 0x3F800000, 0x3F800000, 0x00000000, 0x00000000
dp2_ieee r4.x___, r2.xyxx, l15
mov r3._y_w, r2.zzzw
dcl_literal l16, 0x3F800000, 0x3F800000, 0x00000000, 0x00000000
dp2_ieee r4._y__, r3.xyxx, l16
dcl_literal l17, 0x3F800000, 0x3F800000, 0x00000000, 0x00000000
dp2_ieee r4.__z_, r3.zwzz, l17
dcl_literal l18, 0x3F800000, 0x3F800000, 0x3F800000, 0x3F800000
mov r4.___w, l18
dcl_literal l19, 0x00000030, 0x00000030, 0x00000030, 0x00000030
mov r4119.x___, r1.x
mov r4119._y__, l19
uav_struct_store_id(6) mem0, r4119.xyxx, r4
dcl_literal l20, 0x3F000000, 0x3F000000, 0x3F000000, 0x3F000000
mul_ieee r2.___w, r0.x, l20
add r0.x___, r0.x, r0.x
div_zeroop(infinity) r2._y__, r0.y, r0.x
div_zeroop(infinity) r2.x_z_, r1.zzyz, r0.x
dcl_literal l21, 0x00000040, 0x00000040, 0x00000040, 0x00000040
mov r4120.x___, r1.x
mov r4120._y__, l21
uav_struct_store_id(6) mem0, r4120.xyxx, r2
ret_dyn
end
