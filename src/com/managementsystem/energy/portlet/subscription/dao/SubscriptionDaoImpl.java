package com.managementsystem.energy.portlet.subscription.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.managementsystem.energy.dao.ArticleDao;
import com.managementsystem.energy.domain.Articlecategory;
import com.managementsystem.energy.domain.Subscription;
import com.managementsystem.util.dao.AbstractDaoSupport;

@Repository
public class SubscriptionDaoImpl extends AbstractDaoSupport implements SubscriptionDao {

	private final static Set<Class<?>> dataTypes = new HashSet<Class<?>>(
			Arrays.asList(new Class<?>[] {Subscription.class }));
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public Subscription getSubscriptionByUserid(Long userid)throws DataAccessException{
		Query query = createQuery("from Subscription where userid=? ",userid);
		Subscription  subscription = new Subscription();
		if(query.list().size()>0){
		subscription = new ArrayList<Subscription>(query.list()).get(0);
		}
		return  subscription;
	}
	
	@Override
	public Subscription getSubscription(String subId) throws DataAccessException{
		Query query = createQuery("from Subscription where subId=? ",subId);
		Subscription  subscription = new Subscription();
		if(query.list().size()>0){
		subscription = new ArrayList<Subscription>(query.list()).get(0);
		}
		return  subscription;
	}

	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Set<Class<?>> getTypes() {
		return dataTypes;
	}

	@Override
	public boolean canBeMerged(Object o) {
		return true;
	}
}
