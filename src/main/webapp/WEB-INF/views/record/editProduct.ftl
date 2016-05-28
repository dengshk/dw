    <div class="portlet box blue" style="width:35%;margin-left:35%;margin-top:50px;">
	<div class="portlet-title">
		<div class="caption">
			<#if (product.id)??>编辑产品</#if><#if !(product.id)??>添加产品</#if>
		</div>
		<div class="tools">
			<button class="close" aria-hidden="true" data-dismiss="modal" type="button"></button>
		</div>
	</div>
	<div class="portlet-body form">
		<form class="form-horizontal form-bordered form-row-seperated" id="editUser" method="post">
			<input name="id" type="hidden" id="id" value="${(product.id)!}"/>
			<div class="form-body">
				<!--产品名称-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="name" class="">
						<span style="color:red;">*&nbsp;</span>
						产品名称
					</label>
					<div class="input-icon right col-md-7">
						<input name="name" type="text" class="form-control" id="name" value="${(product.name)!}" maxlength="20" placeholder="请输入产品名称">
						<span class="help-block" for="name"></span>
					</div>
				</div>
				<!--省级代理-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="agent1Price" class="">
						<span style="color:red;">*&nbsp;</span>
						省级代理
					</label>
					<div class="input-icon right col-md-7">
						<input name="agent1Price" type="text" class="form-control " id="agent1Price" value="${(product.agent1Price)!}" maxlength="20" placeholder="请输入省级代理进价">
						<span class="help-block" for="agent1Price"></span>
					</div>
				</div>
				<!--市级代理-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="agent2Price" class="">
						<span style="color:red;">*&nbsp;</span>
						市级代理
					</label>
					<div class="input-icon right col-md-7">
						<input name="agent2Price" type="text" class="form-control " id="agent2Price" value="${(product.agent2Price)!}" maxlength="20" placeholder="请输入市级代理进价">
						<span class="help-block" for="agent2Price"></span>
					</div>
				</div>
				<!--特约代理-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="agent3Price" class="">
						<span style="color:red;">*&nbsp;</span>
						特约代理
					</label>
					<div class="input-icon right col-md-7">
						<input name="agent3Price" type="text" class="form-control " id="agent3Price" value="${(product.agent3Price)!}" maxlength="20" placeholder="请输入特约代理进价">
						<span class="help-block" for="agent3Price"></span>
					</div>
				</div>
				<!--终端代理-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="agent4Price" class="">
						<span style="color:red;">*&nbsp;</span>
						终端代理
					</label>
					<div class="input-icon right col-md-7">
						<input name="agent4Price" type="text" class="form-control " id="agent4Price" value="${(product.agent4Price)!}" maxlength="20" placeholder="请输入终端代理进价">
						<span class="help-block" for="agent4Price"></span>
					</div>
				</div>
				<!--统一售价-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="salePrice" class="">
						<span style="color:red;">*&nbsp;</span>
						统一零售价
					</label>
					<div class="input-icon right col-md-7">
						<input name="salePrice" type="text" class="form-control" id="salePrice" value="${(product.salePrice)!}" maxlength="20" placeholder="请输入统一零售价">
						<span class="help-block" for="salePrice"></span>
					</div>
				</div>
				<!--克数-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="grammage" class="">
						<span style="color:red;">*&nbsp;</span>
						克数
					</label>
					<div class="input-icon right col-md-7">
						<input name="grammage" type="text" class="form-control" id="grammage" value="${(product.grammage)!}" maxlength="20" placeholder="请输入产品克数">
						<span class="help-block" for="grammage"></span>
					</div>
				</div>
				<!--保质期-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="name" class="">
						<span style="color:red;">*&nbsp;</span>
						保质期限
					</label>
					<div class="input-icon right col-md-7">
						<input name="expiration" type="text" class="form-control" id="expiration" value="${(product.expiration)!}" maxlength="20" placeholder="请输入产品保质期(月)">
						<span class="help-block" for="expiration"></span>
					</div>
				</div>
				<!--产品分类-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="typeId" class="">
						<span style="color:red;">*&nbsp;</span>
						产品分类
					</label>
					<div class="input-icon right col-md-7">
						<select class="form-control select2me" name="typeId" id="typeId_child">
							<#if productTypes ?? && productTypes?size &gt; 0>
								<#list productTypes as p>
									<option value="${(p.typeId)!}" <#if product?? && product.typeId?? && p.typeId?number == product.typeId?number>selected="true"</#if>>${(p.typeName)!}</option>
								</#list>
							</#if>
						</select>
					</div>
				</div>
				<!--状态-->
				<div class="form-group" style="padding:10px 0px 0px 0;">
					<label  class="col-md-4" style="text-align:center;margin-top:15px;margin-left:-7px;" for="state" class="">
						<span style="color:red;">*&nbsp;</span>
						产品状态
					</label>
					<div class="col-md-7">
						<div class="make-switch" data-on="success" data-off="danger" data-on-label="在售" data-off-label="下架">
							<input id="state" type="checkbox" <#if !((product.state)??) || product.state == 1>checked</#if> class="toggle"/>
						</div>
					</div>
				</div>
			</div>
			<div class="form-actions modal-footer">
				<button type="button" class="btn blue saveUser">确定</button>
				<button type="button" class="btn default" data-dismiss="modal">取消</button>
			</div>
		</form>
	</div>	
</div>
<!--开关按钮的JS(是否启用)-->
<script src="${application.getContextPath()}/scripts/plugins/bootstrap-switch/static/js/bootstrap-switch.min.js" type="text/javascript" ></script>