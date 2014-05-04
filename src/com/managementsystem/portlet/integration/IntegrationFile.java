package com.managementsystem.portlet.integration;

public class IntegrationFile implements java.io.Serializable {

	private static final long serialVersionUID = -7869438643009870189L;

	private String fileId;
	private String fullName;

	public IntegrationFile() {
		this("", "");
	}

	public IntegrationFile(String fileId, String fullName) {
		this.fileId = fileId;
		this.fullName = fullName;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

}
