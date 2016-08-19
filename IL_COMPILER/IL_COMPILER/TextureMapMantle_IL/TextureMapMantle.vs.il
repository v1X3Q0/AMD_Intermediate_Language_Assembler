il_vs_2_0
dcl_global_flags refactoringAllowed
dcl_cb cb0[4]
dcl_resource_id(0)_type(buffer)_fmtx(float)_fmty(float)_fmtz(float)_fmtw(float)
dcl_resource_id(1)_type(buffer)_fmtx(float)_fmty(float)_fmtz(float)_fmtw(float)
dcl_input_vertexid v0.x___
dcl_output_position o0
dcl_output_generic o1.xy__
load_resource(0)_sampler(0) r0, v0.x
dp4_ieee o0.x___, r0, cb0[0]
dp4_ieee o0._y__, r0, cb0[1]
dp4_ieee o0.__z_, r0, cb0[2]
dp4_ieee o0.___w, r0, cb0[3]
load_resource(1)_sampler(0) r0.xy__, v0.x
mov o1.xy__, r0.xyxx
ret_dyn
end
