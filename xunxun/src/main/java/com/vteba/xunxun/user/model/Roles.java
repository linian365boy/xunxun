package com.vteba.xunxun.user.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.vteba.common.model.AstModel;

@Entity
@Table(name = "roles", catalog = "xunxun")
//@Cacheable
//@Cache(usage = CacheConcurrencyStrategy.READ_ONLY, region="com.skmbw.user.model.Roles")
public class Roles implements AstModel {

	private static final long serialVersionUID = 3391739370239888528L;
	
	private Long roleId;
	private String roleName;
	private String roleDesc;
	private Integer enabled;
	private Integer priority;
	private Set<Authorities> authSets;
	private Date createTime;
	private String authIds;
	private String authNames;
	//private Set<EmpUser> userSet;
	
	public Roles() {
	}

	public Roles(Long roleId, String roleName, String roleDesc,
			Integer enabled, Integer priority, Date createTime) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleDesc = roleDesc;
		this.enabled = enabled;
		this.priority = priority;
		this.createTime = createTime;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "role_id", unique = true, nullable = false)
	public Long getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	@Column(name = "role_name", nullable = false, length = 100)
	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Column(name = "role_desc", length = 150)
	public String getRoleDesc() {
		return this.roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

	@Column(name = "enabled")
	public Integer getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	@Column(name = "priority", nullable = false)
	public Integer getPriority() {
		return this.priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	
	@Column(name="create_time")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@ManyToMany
	@JoinTable(name = "role_auth",//连接表的名字 
	joinColumns = { @JoinColumn(name = "role_id", referencedColumnName = "role_id") }, //name指的是连接表中的栏位名
	inverseJoinColumns = { @JoinColumn(name = "auth_id", referencedColumnName = "auth_id") })//referencedColumnName指的是原来表中的名字
	public Set<Authorities> getAuthSets() {
		return authSets;
	}

	public void setAuthSets(Set<Authorities> authSets) {
		this.authSets = authSets;
	}

	@Transient
	public String getAuthIds() {
		return authIds;
	}

	public void setAuthIds(String authIds) {
		this.authIds = authIds;
	}

	@Transient
	public String getAuthNames() {
		return authNames;
	}

	public void setAuthNames(String authNames) {
		this.authNames = authNames;
	}
	
	//去掉注释就是'用户-角色'双向多对多
//	@ManyToMany(mappedBy = "roles")
//	public Set<EmpUser> getUserSet() {
//		return userSet;
//	}
//
//	public void setUserSet(Set<EmpUser> userSet) {
//		this.userSet = userSet;
//	}

}
