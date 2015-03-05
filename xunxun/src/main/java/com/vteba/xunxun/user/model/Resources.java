package com.vteba.xunxun.user.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.vteba.common.model.AstModel;

/**
 * 资源实体
 * @author yinlei
 * date 2012-12-1 下午3:36:01
 */
@Entity
@Table(name = "resources", catalog = "xunxun")
public class Resources implements AstModel {

	private static final long serialVersionUID = -3656268179709141040L;
	
	public static final String URL = "url";
	public static final String METHOD = "method";
	public static final String ACTION = "action";
	
	private Long resourceId;
	private String resourceName;
	private String resourceType;
	private String resourceUrl;
	private String resourceDesc;
	private Integer enabled;
	private Integer orders;
	private Boolean defaults;
	private Boolean showInMenu;
	private String moduleId;

	public Resources() {
	}

	public Resources(Long resourceId) {
		this.resourceId = resourceId;
	}
	
	public Resources(Long resourceId, String resourceName,
			String resourceType, String resourceUrl, String resourceDesc,
			Integer enabled, Integer orders,
			Boolean defaults, Boolean showInMenu, String moduleId) {
		super();
		this.resourceId = resourceId;
		this.resourceName = resourceName;
		this.resourceType = resourceType;
		this.resourceUrl = resourceUrl;
		this.resourceDesc = resourceDesc;
		this.enabled = enabled;
		this.orders = orders;
		this.defaults = defaults;
		this.showInMenu = showInMenu;
		this.moduleId = moduleId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "resource_id", unique = true, nullable = false)
	public Long getResourceId() {
		return this.resourceId;
	}

	public void setResourceId(Long resourceId) {
		this.resourceId = resourceId;
	}

	@Column(name = "resource_name", nullable = false, length = 100)
	public String getResourceName() {
		return this.resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}

	@Column(name = "resource_type", nullable = false, length = 50)
	public String getResourceType() {
		return this.resourceType;
	}

	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}

	@Column(name = "resource_url", length = 200)
	public String getResourceUrl() {
		return this.resourceUrl;
	}

	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}

	@Column(name = "resource_desc", length = 150)
	public String getResourceDesc() {
		return this.resourceDesc;
	}

	public void setResourceDesc(String resourceDesc) {
		this.resourceDesc = resourceDesc;
	}

	@Column(name = "enabled")
	public Integer getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	@Column(name = "orders")
	public Integer getOrders() {
		return this.orders;
	}

	public void setOrders(Integer orders) {
		this.orders = orders;
	}
	
	@Column(name = "defaults")
	public Boolean getDefaults() {
		return defaults;
	}

	public void setDefaults(Boolean defaults) {
		this.defaults = defaults;
	}

	@Column(name = "show_in_menu")
	public Boolean getShowInMenu() {
		return showInMenu;
	}

	public void setShowInMenu(Boolean showInMenu) {
		this.showInMenu = showInMenu;
	}

	@Column(name = "module_id", length = 45)
	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

}
