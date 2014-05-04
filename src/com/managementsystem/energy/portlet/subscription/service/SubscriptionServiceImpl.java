package com.managementsystem.energy.portlet.subscription.service;

import java.util.Calendar;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.domain.Subscription;
import com.managementsystem.energy.portlet.subscription.dao.SubscriptionDao;

@Service
public class SubscriptionServiceImpl implements SubscriptionService {

	private final Log logger = LogFactory.getLog(getClass());
	private Calendar calendar = Calendar.getInstance();

	@Autowired
	private SubscriptionDao subscriptionDao;

	@Transactional(readOnly = true)
	public Subscription getSubscriptionByUserid(Long userid) {
		return subscriptionDao.getSubscriptionByUserid(userid);
	}
	
	@Transactional
	public void saveOrUpdateSubscription(Subscription subscription) {
		if (subscription.getSubId()!= null && subscription.getSubId() != "") {
			if (getSubscription(subscription.getSubId()) != null) {
				updateSubscription(subscription);
			}
		}
		else {
			saveSubscription(subscription);
		}
	}
	
	@Transactional(readOnly = true)
	public Subscription getSubscription(String subId) {
		return subscriptionDao.getSubscription(subId);
	}
	
	@Transactional
	public void updateSubscription(Subscription subscription) {
		try{
		logger.info("SubscriptionServiceImpl updateSubscription");
		subscription.setCreatedondate(calendar.getTime());
		subscription.setModifiedondate(calendar.getTime());
		subscriptionDao.store(subscription);
		subscriptionDao.flush();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional
	public void saveSubscription(Subscription subscription) {
		logger.info("SubscriptionServiceImpl saveSubscription");
		subscription.setCreatedondate(calendar.getTime());
		subscriptionDao.save(subscription);
		subscriptionDao.flush();
	}
}