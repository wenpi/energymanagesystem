package com.managementsystem.portlet.integration;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletPreferences;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.managementsystem.util.BeanUtil;
import com.managementsystem.util.io.FileSystemObject;

@Service
public class IntegrationServiceImpl implements IntegrationService {

	@Transactional(readOnly=true)
	@Override
	public List<IntegrationFile> getFiles(String pathname, String suffix) {
		
		Assert.hasLength(pathname);

		List<IntegrationFile> result = new ArrayList<IntegrationFile>();
		
		File fileDir = new File(pathname);
		File[] files = fileDir.listFiles();
		if(files==null)
			return null;
		for(int i=0;i<files.length;i++) {
			File file = files[i];
			String filename = file.getName();
			String key = filename;
			if(StringUtils.hasLength(suffix)) {
				if(filename.indexOf(suffix)>0) {		
					key = filename.replace(filename, suffix);
				}
			}
			result.add(new IntegrationFile(key,filename));
		}
		
		return result;
	}

	@Transactional(readOnly=true)
	@Override
	public IntegrationMode getIntegrationMode(PortletPreferences prefs) {
		
		if (prefs.getMap().size() == 0)
			return null;
		
		IntegrationMode integrationMode = new IntegrationMode();	
		
		return (IntegrationMode)BeanUtil.setProperty(prefs.getMap(), integrationMode);
		
	}

	@Transactional
	@Override
	public String uploadFiles(IntegrationMode integrationMode,String realPath) {
		String result = "";
		CommonsMultipartFile file = integrationMode.getFile();
		if(file!=null && file.getSize()>0) {
			try {
				String subPath = integrationMode.subPath;
				if(StringUtils.hasLength(subPath)) {
					if (!subPath.substring(0, 1).equals("/")) {
						realPath = realPath+"/";
					}
					realPath += integrationMode.subPath;
				}
				result = FileSystemObject.SaveZipFileAndUnZip(file.getInputStream(), realPath, file.getOriginalFilename(),"gb2312");
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
	}
	
	

}
