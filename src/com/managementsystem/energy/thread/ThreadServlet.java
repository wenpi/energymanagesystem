package com.managementsystem.energy.thread;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Timer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.springframework.beans.factory.annotation.Autowired;
//import com.managementsystem.energy.service.ImportService;

public class ThreadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private final static Log logger = LogFactory.getLog(ThreadServlet.class);

//	@Autowired
//	private ImportService importService;

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
					// logger.info("dir---" + dir);

					// 如果dir不以文件分隔符结尾，自动添加文件分隔符
					if (!dir.endsWith(File.separator)) {
						dir = dir + File.separator;
					}
					File dirFile = new File(dir);
					// 如果dir对应的文件不存在，或者不是一个目录，则退出
					if (!dirFile.exists() || !dirFile.isDirectory()) {
						logger.info("删除目录失败" + dir + "目录不存在！");
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
								logger.info("delete file [" + fileName + "] success！");
							} else {
								logger.info("delete file [" + fileName + "] failure！");
							}
						}
					}
				}
				
				// 每隔10分钟连接一下数据库
//				if(date.getHours() % 2 == 0 && (date.getMinutes() == 0) && date.getSeconds() == 0) {
//					
//					logger.info("-------------------------添加临时记录开始！-------------------------");
//					importService.addTemp();
//					logger.info("-------------------------添加临时记录结束！-------------------------");
//					
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