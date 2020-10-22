walk2.2.0  
1、重要升级：springboot升级到2.x，目前版本2.3.4.RELEASE  
2、重要升级：jdk最低要求1.8，spring升级到5.2.9.RELEASE，其他相关依赖一并升级  
	基于2.1.x的老工程升级到2.2.0方法：  
		1、BootRun exclude加入SpringDataWebAutoConfiguration.class  
		2、server.context-path改成server.servlet.context-path  
		3、transaction.xml中注掉<tx:annotation-driven transaction-manager="txManager"/>  
		4、gradle-wrapper.properties中distributionUrl改成http\://nexus.walkframework.org:8081/nexus/service/local/repositories/releases/content/gradle/gradle/6.6.1/gradle-6.6.1-bin.zip  
		5、build.cmd、build.gradle、gradle.properties、pom.xml相应改动，详见示例工程  
		web工程：server.jsp-servlet.init-parameters.development改成server.servlet.jsp.init-parameters.development，引入walk-activiti的工程application.properties中加入spring.autoconfigure.exclude[0]=org.activiti.spring.boot.SecurityAutoConfiguration  
		api工程：spring-mvc.xml加入<context:component-scan base-package="org.walkframework.restful" />、<context:component-scan base-package="springfox" />，注释SwaggerConfig  
3、注意：2.1.x与2.2.x将并行维护一段时间
walk2.1.13  
1、walk-restful代码生成器加入自动生成controller与service方法，打印到控制台  
2、walk-tools jdbc方式dbcp数据源密码解密处理  
3、shiro版本升级到1.6.0  
4、导出注解DataExport加入导出类型约束  
5、解决异步导出报There is no session问题  

walk2.1.12  
1、walk-shiro增加静态资源过滤器，避免静态资源频繁的操作session，spring-config-shiro.xml文件shiroFilter配置里的静态资源使用res即可  
2、walk-restful增加有状态API调用方式，以满足前后端分离开发模式 。  
3、walk-restful优化日志输出，方便后续控制日志级别 。  
4、walk-batis解决mysql未创建序列表时看不到报错信息问题  
5、walk-activiti会签提交报错问题修复
6、修复弹出窗iframe页面重复加载问题  
7、修复其他一些问题  

walk2.1.11  
1、增加功能：可根据数据库表生成增删改查代码及实体类

walk2.1.10  
1、walk-data中增加getStringArray方法用以将字符串数组转换为以分隔符分隔的字符串
2、修复异步导出条件切换无效问题
3、修复相关oracle特殊语法问题
4、修复其他相关bug

walk2.1.9  
修改静态资源文件路径，保持与springboot规范一致。新建static目录，将component目录挪到其下  
工程配置需做相关调整，最新请看webdemo工程  
1、spring-config-shiro.xml：修改/nav/login为/login/navlogin;修改formlogin为/login/formlogin;删除component/、pages/等配置  
2、spring-mvc.xml：增加/static/component/**映射，删除component/**映射  
3、application.properties：修改page.loginUrl为/login/navlogin  
4、Login.jsp：/formlogin修改为/login/formlogin
5、批量替换component/resources为static/component/resources

walk2.1.8  
解决springcloud环境中配置热加载问题  
工程配置需做相关调整，最新请看webdemo工程  
	1、spring-config.xml、spring-mvc.xml中去掉属性配置<bean id="propertyConfigurer" class="org.walkframework.base.tools.spring.SpringPropertyHolder">...  
	2、spring-config.xml中引入spring-mvc.xml，在<beans:import resource="classpath:spring/ds/ds-dbcp.xml"/>后面加上如下配置  
		<!-- 引入springmvc-->  
		<beans:import resource="#{'${spring.boot.mvc.load}'=='true'?'classpath:spring/spring-mvc.xml':'classpath:base/common/spring/emptyfile.xml'}"/>  
	3、spring-mvc.xml中去掉<bean class="org.walkframework.base.tools.spring.SpringContextHolder" lazy-init="false" />   

walk2.1.7  
1、easyui升级到1.8.1  
2、增加定时导出功能  

walk2.1.6  
1、walk-batis Conditions方式优化  
2、增加ajaxfileupload组件，ajax方式上传文件  

walk2.1.5  
1、增加walk-activiti模块  
2、walk-base增加实体类翻译器(@EntityTranslate)、sql翻译器(@SqlTranslate)  
3、walk-batis增加selectListBySql方法，但仅限框架内部使用  
4、walk-boot增加jsonp过滤器自动加载  
4、walk.js增加 uuid、live函数

walk2.1.4  
1、walk-shiro：增加静默登录流程  
2、walk-batis：修复mybatis-config.xml中defaultExecutorType=SIMPLE时，实体类更新无效问题  
3、walk-batis：实体类查询增加noAnyCondition方法，如未调用此方法，则查询、更新、删除必须带条件才可执行，否则抛错  
4、walk-batis：mysql获取序列时内部修改为异步方式，避免事物只读抛错  

walk2.1.3  
1、增加异步导出功能，以避免同步方式导出文件过大时间过长导致的超时问题。  

walk2.1.2  
1、walk-restful翻译器节点入参改为必传，如不传或传null则不会执行翻译器  
2、walk-restful打印接口日志改成info级别，并增加耗时时间  
3、walk-restful增加无状态接口权限校验机制  

walk2.1.1  
1、walk-restful加入签名校验拦截器  
2、walk-shiro RouteAuthFilter修改，解决会话重复创建问题  
3、walk-shiro jcaptcha图形验证码解决集群环境下问题  
4、修改SpringPropertyHolder 兼容spring boot方式启动外部指定参数优先启动  

walk2.1.0  
1、jdk升到1.7  
2、引入HikariCP连接池，一款高性能连接池  
3、加入Spring boot支持，老工程结构可不用做任何改变，但需修改如下  
	1）app.properties文件：加入spring boot相关配置，详看walk-example工程  
	2）加入数据源配置文件boot-ds.xml，详看walk-example工程  
	3）修改构建脚本build.gradle、build.cmd，详看walk-example工程  
	walk-example工程路径：http://10.20.16.72:7511/svn/DD3/walk-example  
注意：  
	本地开发方法：以walk-example为例  
		1、下完代码后执行build.cmd，编译工程  
		2、直接执行该类main方法即可src/main/java/com/asiainfo/walk/example/tools/BootRun.java  
	jar包方式运行方法：  
		1、执行build.cmd，选择发布工程，生成jar后直接运行命令即可：java -jar walk-example.jar。可看build.cmd内的命令，加了-x findMainClass，这是非常必要的。  
		2、启动时可指定参数，例如java -jar walk-example.jar --server.port=8089 --server.context-path=/walk-example --ds.location=file:/E:/jar/boot-ds.xml  

walk2.0.81  
1、walk.js中_openUrlDialog函数onloadSuccess增加参数：easyui弹窗window对象  
2、walk-restful SwaggerConfig增加正则匹配路径设置  
3、walk-shiro 解决会话固定攻击(Session fixation attack)问题。普通登录情况下，非CAS环境。  
4、walk-cache 解决远程加载缓存名时分隔符中带有特殊符号问题。修改lua脚本对特殊字符做处理  
5、walk-mq 队列迭代方法增加分页  
6、w:set标签bug修改  
7、基于JACKSON的json工具类JsonUtil。JACKSON反序列化时可以调用set方法，在某些情况下是必要的。  
8、easyui的confirm、prompt对话框按钮实现可定制样式  
9、修改工具类org.walkframework.cache.util.ReflectHelper，可支持查找本类及父类属性及方法  
10、spring、shiro、mybatis版本升到最新  
11、增加walk-console模块，用于缓存、队列、会话等监控  

walk2.0.80  
1、walk-cache针对ehcache设置过期时间方法(expire)bug修复  
2、walk-cache针对redis获取元素剩余存活时间方法(ttl)bug修复  
3、修改org.walkframework.base.system.security.DefaultUserService.findUser方法，兼容mysql  

walk2.0.79  
1、walk-batis加入mysql获取序列支持，调用方法与之前没变化dao.getSequence("seq_xxx")。支持步骤见org.walkframework.batis.dialect.MySQLDialect getSequence方法备注  
2、DefaultUserService中加载菜单方法findMenus调整，用以兼容mysql及其他数据库  
3、w:script、w:link、w:img标签加入相对路径支持  
4、修复walk-shiro中CAS单点退出问题。现象：新加CAS登录流程的时候，例如/o2ologin，无法单点退出  
5、jquery-extend.js加入提示信息抖动效果函数，调用示例：$("#msg-box").shake(2, 10, 400);  

walk2.0.78  
1、cas服务端使用的webflow标签加入属性值支持  

walk2.0.77  
1、config.js94行多个逗号，导致在IE6下报错  
2、增加系统通知功能org.walkframework.base.system.task.NotifyTask  
3、Common.getIpAddr方法修改  

walk2.0.76  
1、walk-redis对redis的cluster模式支持  
2、walk-redis修复scan命令造成的造成java.lang.ClassCastException: [B cannot be cast to XXX错误  
3、walk-cache的redis方式增加keys按分页查询，同时size方法新增可按指定key匹配取总数  
4、静态参数加载器xml文件中增加参数是否加载控制。  
	例如：<StaticParams load="false">load默认为true  
		  <table key="TD_S_STATIC" load="false"/> load默认为true  
5、web.xml中需增加配置org.walkframework.base.system.initializer.WalkApplicationContextInitializer，用于预先加载属性文件，以便beans:import标签使用  
	例如：<beans:import resource="classpath:spring/cache/spring-${cache.cacheDriver}.xml"/>  
6、web.xml中需增加配置org.walkframework.base.system.initializer.WalkXmlWebApplicationContext，用于解析SpEL表达式，以便beans:import标签使用  
	例如：<beans:import resource="#{'${shiro.sharedSession}'=='true'?'classpath:spring/cache/spring-redis-shared-session.xml':'classpath:base/common/spring/emptyfile.xml'}"/>  
7、routeAuthFilter增加defaultAuthFilterName配置，以便统一在app.properties文件中配置默认的认证过滤器，设置了此属性不能设置defaultAuthFilter属性  
	例如：<bean id="routeAuthFilter" class="org.walkframework.shiro.web.filter.authc.RouteAuthFilter">  
        	<property name="defaultAuthFilterName" value="#{'${shiro.defaultAuthFilter}'!=''?'${shiro.defaultAuthFilter}':'formAuthFilter'}"/>  
        	...  
        	
walk2.0.75  
1、取消队列出队方法的锁操作  
2、引入基于redis的全局锁简单实现。  
//全局锁使用示例  
RedisOperations cacheRedisOperations = SpringContextHolder.getBean("cacheRedisOperations", RedisOperations.class);   
RedisLock lock = new RedisLock(cacheRedisOperations, "testlock");  
lock.execute(new LockCallback<Object>(){  
	@Override  
	public Object doInLock(RedisConnection connection) {  
		//执行具体的业务逻辑...  
		return null;  
	}  
});  
 
walk2.0.74  
缓存注解ICacheable、ICachePut缓存秒数(cacheSeconds)修改为String类型，方便使用${}表达式获取变量值  
walk2.0.73  
1、增加w:script、w:link、w:img标签，可设置资源版本号，避免修改资源文件浏览器缓存问题。具体用法在工程的Version.jsp中设置统一的版本号，也可单独针对每个资源文件设置版本号  
2、修改w:set标签，value如果是类名或实例或spring定义的service名称必须以@打头，普通值不用  
3、调整walk-logger目录结构  
4、spring以及相关版本升级  

walk2.0.72  
修改一些类中e.printStackTrace();为log.error();防止在工程的日志文件中看不到日志信息  

walk2.0.71  
新增easyui树搜索组件  

walk2.0.70  
1、基于安全考虑，避免mybatis抛错时直接将sql抛到前台  
2、修复walk-restful使用缓存注解不生效问题  

walk2.0.69  
1、修复导入校验失败后下载错误详情文件时报错问题  
2、修复walk-shiro的realm动态切换时bug  
3、加入静态参数缓存管理器与加载器  
