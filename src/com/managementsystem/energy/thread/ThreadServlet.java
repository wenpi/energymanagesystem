package com.managementsystem.energy.thread;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Timer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.managementsystem.energy.domain.QueryScheme;
import com.managementsystem.energy.service.QuerySchemeService;

public class ThreadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	private QuerySchemeService querySchemeService;

	public ThreadServlet() {
		super();
	}

	public void init() throws ServletException {
		Timer timer = new Timer();
		timer.schedule(new MyTask(), 1000, 1000);// 在1秒后执行此任务,每次间隔1秒,如果传递一个Data参数,就可以在某个固定的时间执行这个任务.
	}

	// 具体执行的任务
	class MyTask extends java.util.TimerTask {
		public void run() {
			try {
				Date date = new Date();
				if ((date.getMinutes() == 0 || date.getMinutes() == 30) && date.getSeconds() == 0) {
					
					// 获取当前项目所在tomcat中的位置
					String dir = this.getClass().getResource("/").getPath();
					dir = dir.substring(1, dir.lastIndexOf("WEB-INF")) + "uploadfiles";
					// System.out.println("dir---" + dir);

					// 如果dir不以文件分隔符结尾，自动添加文件分隔符
					if (!dir.endsWith(File.separator)) {
						dir = dir + File.separator;
					}
					File dirFile = new File(dir);
					// 如果dir对应的文件不存在，或者不是一个目录，则退出
					if (!dirFile.exists() || !dirFile.isDirectory()) {
						System.out.println("删除目录失败" + dir + "目录不存在！");
					}
					// 删除文件夹下的所有文件(不包括子目录)
					File[] files = dirFile.listFiles();
					for (int i = 0; i < files.length; i++) {
						// 删除子文件
						if (files[i].isFile()) {
							String fileName = files[i].getAbsolutePath();
							File file = new File(fileName);
							if (file.isFile() && file.exists()) {
								file.delete();
								System.out.println("删除单个文件" + fileName + "成功！");
							} else {
								System.out.println("删除单个文件" + fileName + "失败！");
							}
						}
					}
				}
				
				// 每隔10分钟连接一下数据库
//				if((date.getMinutes() % 10 == 0 || date.getMinutes() % 5 == 0) && date.getSeconds() == 0) {
//					System.out.println("进来了thread");
//
//					// 获取当前项目所在tomcat中的位置
//					String dir = this.getClass().getResource("/").getPath();
//					dir = dir.substring(1, dir.lastIndexOf("WEB-INF")) + "WEB-INF/context/";
//					System.out.println("---" + dir);
//					ApplicationContext ctx = new ClassPathXmlApplicationContext(dir + "applicationContext.xml");
//					querySchemeService = (QuerySchemeService)ctx.getBean("QuerySchemeService");
//					
//					List<QueryScheme> querySchemes = new ArrayList<QueryScheme>();
//					try {
//						querySchemes = querySchemeService.getQuerySchemeListByCondition("chiller", "", "冷冻水回水温度", "P1", "");
//					} catch (Exception e) {
//						System.out.println("thread-error");
//					}
//					System.out.println("thread--" + querySchemes.size());
//				}
			} catch (Exception e) {
				// e.printStackTrace();
			}
		}
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}