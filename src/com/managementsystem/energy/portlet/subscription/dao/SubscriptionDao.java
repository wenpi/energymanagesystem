package com.managementsystem.energy.portlet.subscription.dao;

import org.springframework.dao.DataAccessException;

import com.managementsystem.energy.domain.Subscription;
import com.managementsystem.util.dao.DaoSupport;

public interface SubscriptionDao extends DaoSupport{
	
	public	Subscription getSubscriptionByUserid(Long userid) throws DataAccessException;
	
	public Subscription getSubscription(String subId) throws DataAccessException;

}