package com.vteba.xunxun.user.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Immutable;

import com.vteba.common.model.AstModel;

/**
 * 菜单 
 * @author yinlei 
 * date 2012-6-6 下午7:10:20
 */
@Entity
@Table(name = "module_menu", catalog="xunxun")
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_ONLY, region="com.skmbw.common.model.ModuleMenu")
@Immutable
public class ModuleMenu implements AstModel{
	private static final long serialVersionUID = 2250567025109128227L;
	private String moduleId;
	private String moduleName;
	private Date createTime;
	private Boolean enable;//是否可用
	private Integer orders;//显示顺序
	private List<Authorities> authorities = new ArrayList<Authorities>();//用户权限

	public ModuleMenu() {
	}

	public ModuleMenu(String moduleId, String moduleName, Date createTime,
			boolean enable, Integer orders, List<Authorities> authorities) {
		super();
		this.moduleId = moduleId;
		this.moduleName = moduleName;
		this.createTime = createTime;
		this.enable = enable;
		this.orders = orders;
		this.authorities = authorities;
	}

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "org.hibernate.id.UUIDGenerator")
	@Column(name = "module_id")
	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	@Column(name = "module_name")
	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "enable")
	public Boolean getEnable() {
		return enable;
	}

	public void setEnable(Boolean enable) {
		this.enable = enable;
	}

	@Column
	public Integer getOrders() {
		return orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}

	@Transient
	public List<Authorities> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<Authorities> authorities) {
		this.authorities = authorities;
	}
}
