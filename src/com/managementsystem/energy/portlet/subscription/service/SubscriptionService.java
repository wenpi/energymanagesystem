package com.managementsystem.energy.portlet.subscription.service;

import com.managementsystem.energy.domain.Subscription;


/**
 * 图表数据处理接口
 * 
 * @author CHENPING 2012-7-4
 * */
public interface SubscriptionService {
	/**
	 * @param userid
	 * */
	public Subscription getSubscriptionByUserid(Long userid);
	
	public void  saveOrUpdateSubscription(Subscription subscription);
}