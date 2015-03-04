package com.vteba.xunxun.user.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.springframework.security.core.CredentialsContainer;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.util.Assert;

import com.vteba.common.model.AstModel;
import com.vteba.security.user.IUserDetails;

/**
 * 用户
 * @author yinlei 
 * date 2012-5-7 下午2:53:33
 */
@Entity
@Table(name = "emp_user", catalog = "skmbw",uniqueConstraints = @UniqueConstraint(columnNames = "user_account"))
public class EmpUser implements IUserDetails, CredentialsContainer, AstModel {

	private static final long serialVersionUID = -435233051971566167L;

	private Long userId;
	private String name;
	private String email;
	private String pass;
	private String deptId;
	private String deptName;
	private Long managerId;
	private String managerName;
	private Date createDate;
	private Integer enable;
	private String userAccount;
	private String tenantIdentifier;
	private List<ModuleMenu> moduleMenus;//该用户的菜单权限
	private Set<Roles> roleSet = new HashSet<Roles>();
	//transient,封装的角色名
	private String roleNames;
	
	//UserDetails' fields is Transient
	private String password;
    private String username;//还用来封装页面的authId
    private Set<GrantedAuthority> authorities;
    private boolean accountNonExpired;//账户没有过期
    private boolean accountNonLocked;
    private boolean credentialsNonExpired;
    private boolean enabled;
    
	public EmpUser() {
	}

	public EmpUser(String name, String email, String pass, String deptId,
			String deptName, Date createDate, Integer enable, String userAccount) {
		this.name = name;
		this.email = email;
		this.pass = pass;
		this.deptId = deptId;
		this.deptName = deptName;
		this.createDate = createDate;
		this.enable = enable;
		this.userAccount = userAccount;
	}
	public EmpUser(Long userId, String name, String email, String pass,
			String deptId, String deptName, Date createDate,
			Integer enable, String userAccount,
			Set<Roles> roleSet, String password, String username,
			Set<GrantedAuthority> authorities, boolean accountNonExpired,
			boolean accountNonLocked, boolean credentialsNonExpired,
			boolean enabled) {
		super();
		if (((userAccount == null) || "".equals(userAccount)) || (pass == null)) {
            throw new IllegalArgumentException("userAccount and pass cannot be null or empty values to constructor");
        }
		this.userId = userId;
		this.name = name;
		this.email = email;
		this.pass = pass;
		this.deptId = deptId;
		this.deptName = deptName;
		this.createDate = createDate;
		this.enable = enable;
		this.userAccount = userAccount;
		this.roleSet = roleSet;
		this.password = password;
		this.username = username;
		this.authorities = Collections.unmodifiableSortedSet(sortAuthorities(authorities));
		this.accountNonExpired = accountNonExpired;
		this.accountNonLocked = accountNonLocked;
		this.credentialsNonExpired = credentialsNonExpired;
		this.enabled = enabled;
	}
	
	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "user_id", unique = true, nullable = false)
	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Column(name = "name", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "pass", nullable = false, length = 50)
	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
	@Column(name = "dept_id", length = 45)
	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	
	@Column(name = "dept_name", length = 100)
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	@Column(name = "manager_id")
	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}
	
	@Column(name = "manager_name", length = 50)
	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", nullable = false, length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "enable")
	public Integer getEnable() {
		return this.enable;
	}

	public void setEnable(Integer enable) {
		this.enable = enable;
	}

	@Column(name = "user_account", unique = true, nullable = false, length = 100)
	public String getUserAccount() {
		return this.userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	
	@Column(name = "tenant_identifier", length = 50)
	public String getTenantIdentifier() {
		return tenantIdentifier;
	}

	public void setTenantIdentifier(String tenantIdentifier) {
		this.tenantIdentifier = tenantIdentifier;
	}
	
	@ManyToMany(fetch = FetchType.LAZY)
	@org.hibernate.annotations.BatchSize(size = 10)
	@org.hibernate.annotations.Fetch(org.hibernate.annotations.FetchMode.SUBSELECT)
	@JoinTable(name = "user_role", //连接表名
	joinColumns = { @JoinColumn(name = "user_id", referencedColumnName = "user_id") }, //name指的是连接表中的栏位名
	inverseJoinColumns = { @JoinColumn(name = "role_id", referencedColumnName = "role_id") })//referencedColumnName(参考栏位)指的是原来表中的名字
	public Set<Roles> getRoleSet() {
		return roleSet;
	}

	public void setRoleSet(Set<Roles> roleSet) {
		this.roleSet = roleSet;
	}
	
	//@org.hibernate.annotations.BatchSize(size=10)//批量抓取
	//@org.hibernate.annotations.Fetch(org.hibernate.annotations.FetchMode.SELECT)//第二个查询
	//@org.hibernate.annotations.Fetch(org.hibernate.annotations.FetchMode.SUBSELECT)//子查询
	//@org.hibernate.annotations.Cache(usage=org.hibernate.annotations.CacheConcurrencyStrategy.READ_WRITE)//缓存方案
	///@OneToMany(fetch = FetchType.LAZY, mappedBy = "empUser")//反转端，被支配端 
	///public Set<UserRole> getUserRoles() {
		///return this.userRoles;
	///}

	///public void setUserRoles(Set<UserRole> userRoles) {
		///this.userRoles = userRoles;
	///}
	
	@Transient
	public List<ModuleMenu> getModuleMenus() {
		return moduleMenus;
	}

	public void setModuleMenus(List<ModuleMenu> moduleMenus) {
		this.moduleMenus = moduleMenus;
	}
	
	//以下为UserDetails methods
	
	@Transient
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Transient
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Transient
	public Set<GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Set<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	
	@Transient
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}
	
	@Transient
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}
	
	@Transient
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}
	
	@Transient
	public boolean isEnabled() {
		return enabled;
	}
	
	@Transient
	public String getRoleNames() {
		return roleNames;
	}

	public void setRoleNames(String roleNames) {
		this.roleNames = roleNames;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void eraseCredentials() {
        password = null;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString()).append(": ");
        sb.append("UserAccount: ").append(this.userAccount).append("; ");
        sb.append("UserId: ").append(this.userId).append("; ");
        sb.append("Email: ").append(this.email).append("; ");
        sb.append("DeptId: ").append(this.deptId).append("; ");
        sb.append("ManagerId: ").append(this.managerId).append("; ");
        sb.append("Name: ").append(this.name).append("; ");
        sb.append("Username: ").append(this.username).append("; ");
        sb.append("Password: [PROTECTED]; ");
        sb.append("Enabled: ").append(this.enabled).append("; ");
        sb.append("AccountNonExpired: ").append(this.accountNonExpired).append("; ");
        sb.append("CredentialsNonExpired: ").append(this.credentialsNonExpired).append("; ");
        sb.append("AccountNonLocked: ").append(this.accountNonLocked).append("; ");
        if (authorities != null && !authorities.isEmpty()) {
            sb.append("Granted Authorities: ");
            boolean first = true;
            for (GrantedAuthority auth : authorities) {
                if (!first) {
                    sb.append(",");
                }
                first = false;
                sb.append(auth);
            }
        } else {
            sb.append("Not granted any authorities");
        }
        return sb.toString();
    }
    @Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (enabled ? 1231 : 1237);
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((pass == null) ? 0 : pass.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((userAccount == null) ? 0 : userAccount.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result
				+ ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EmpUser other = (EmpUser) obj;
		if (enabled != other.enabled)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (pass == null) {
			if (other.pass != null)
				return false;
		} else if (!pass.equals(other.pass))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (userAccount == null) {
			if (other.userAccount != null)
				return false;
		} else if (!userAccount.equals(other.userAccount))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

	private static SortedSet<GrantedAuthority> sortAuthorities(Collection<? extends GrantedAuthority> authorities) {
        Assert.notNull(authorities, "Cannot pass a null GrantedAuthority collection");
        
        SortedSet<GrantedAuthority> sortedAuthorities = new TreeSet<GrantedAuthority>(new AuthorityComparator());
        for (GrantedAuthority grantedAuthority : authorities) {
            Assert.notNull(grantedAuthority, "GrantedAuthority list cannot contain any null elements");
            sortedAuthorities.add(grantedAuthority);
        }
        return sortedAuthorities;
    }

    private static class AuthorityComparator implements Comparator<GrantedAuthority>, Serializable {
		private static final long serialVersionUID = -4436745229680416576L;
		public int compare(GrantedAuthority g1, GrantedAuthority g2) {           
            if (g2.getAuthority() == null) {
                return -1;
            }
            if (g1.getAuthority() == null) {
                return 1;
            }
            return g1.getAuthority().compareTo(g2.getAuthority());
        }
    }
}
