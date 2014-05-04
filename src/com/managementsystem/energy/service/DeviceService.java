package com.managementsystem.energy.service;

import java.util.List;

import com.managementsystem.energy.domain.Ahu;
import com.managementsystem.energy.domain.Boi;
import com.managementsystem.energy.domain.Chi;
import com.managementsystem.energy.domain.Ct;
import com.managementsystem.energy.domain.Fcu;
import com.managementsystem.energy.domain.Heater;
import com.managementsystem.energy.domain.Lift;
import com.managementsystem.energy.domain.Lighting;
import com.managementsystem.energy.domain.Pump;
import com.managementsystem.energy.domain.Vav;
import com.managementsystem.util.dao.Page;

public interface DeviceService {
//  制冷机	维护
	public Page getPagedChis(int pageIndex,int pageSize);
	
	public Page getPagedChisBySearch(int pageIndex,int pageSize,String no,String buildId,String regionId);
	
	public Chi getChi(long  id);
	
	public void addChi(Chi chi);
	
	public void updateChi(Chi chi);
	
	public void deleteChi(long  id);
	
	public List<Chi> getChiList (String no,String buildId,String regionId);
	
//  锅炉维护
    public Page getPagedBois(int pageIndex,int pageSize);
	
	public Page getPagedBoisBySearch(int pageIndex,int pageSize,String no,String buildId,String regionId);
	
	public Boi getBoi(long  id);
	
	public void addBoi(Boi boi);
	
	public void updateBoi(Boi boi);
	
	public void deleteBoi(long  id);
	
	public List<Boi> getBoiList (String no,String buildId,String regionId);
	
//  水泵维护
    public Page getPagedPumps(int pageIndex,int pageSize);
	
	public Page getPagedPumpsBySearch(int pageIndex,int pageSize,String no,String buildId,String regionId);
	
	public Pump getPump(long  id);
	
	public void addPump(Pump pump);
	
	public void updatePump(Pump pump);
	
	public void deletePump(long  id);
	
	public List<Pump> getPumpList (String no,String buildId,String regionId);
	
//冷却塔维护
	public Page getPagedCts(int pageIndex,int pageSize);
		
	public Page getPagedCtsBySearch(int pageIndex,int pageSize,String no,String buildId,String regionId);
		
	public Ct getCt(long  id);
		
	public void addCt(Ct ct);
		
	public void updateCt(Ct ct);
		
	public void deleteCt(long  id);
	
	public List<Ct> getCtList (String no,String buildId,String regionId);
	
//  空调箱维护
    public Page getPagedAhus(int pageIndex,int pageSize);
	
	public Page getPagedAhusBySearch(int pageIndex,int pageSize,String no,String buildId,String regionId);
	
	public Ahu getAhu(long  id);
	
	public void addAhu(Ahu ahu);
	
	public void updateAhu(Ahu ahu);
	
	public void deleteAhu(long  id);
	
	public List<Ahu> getAhuList (String no,String buildId,String regionId);
	
//  风机盘管
    public Page getPagedFcus(int pageIndex,int pageSize);
	
	public Page getPagedFcusBySearch(int pageIndex,int pageSize,String no,String buildId,String regionId);
	
	public Fcu getFcu(long  id);
	
	public void addFcu(Fcu fcu);
	
	public void updateFcu(Fcu fcu);
	
	public void deleteFcu(long  id);
	
	public List<Fcu> getFcuList (String no,String buildId,String regionId);
	
//  变风量箱维护
  public Page getPagedVavs(int pageIndex,int pageSize);
	
	public Page getPagedVavsBySearch(int pageIndex,int pageSize,String no,String buildId,String regionId);
	
	public Vav getVav(long  id);
	
	public void addVav(Vav vav);
	
	public void updateVav(Vav vav);
	
	public void deleteVav(long  id);
	
	public List<Vav> getVavList (String no,String buildId,String regionId);
	
//  灯具维护
    public Page getPagedLightings(int pageIndex,int pageSize);
	
	public Page getPagedLightingsBySearch(int pageIndex,int pageSize,String no,String buildId,String regionId);
	
	public Lighting getLighting(long  id);
	
	public void addLighting(Lighting lighting);
	
	public void updateLighting(Lighting lighting);
	
	public void deleteLighting(long  id);
	
	public List<Lighting> getLightingList (String no,String buildId,String regionId);
	
//  电梯维护
    public Page getPagedLifts(int pageIndex,int pageSize);
	
	public Page getPagedLiftsBySearch(int pageIndex,int pageSize,String no,String buildId,String regionId);
	
	public Lift getLift(long  id);
	
	public void addLift(Lift lift);
	
	public void updateLift(Lift lift);
	
	public void deleteLift(long  id);
	
	public List<Lift> getLiftList (String no,String buildId,String regionId);
	
//  电加热器
	public Page getPagedHeaters(int pageIndex,int pageSize);
		
	public Page getPagedHeatersBySearch(int pageIndex,int pageSize,String no,String buildId,String regionId);
		
	public Heater getHeater(long  id);
		
	public void addHeater(Heater heater);
		
	public void updateHeater(Heater heater);
		
	public void deleteHeater(long  id);
	
	public List<Heater> getHeaterList (String no,String buildId,String regionId);
}
