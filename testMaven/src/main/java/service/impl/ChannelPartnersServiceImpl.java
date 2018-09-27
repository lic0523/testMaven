package service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pojo.ChannelPartners;
import service.ChannelPartnersService;
import dao.ChannelPartnersDao;

@Service("channelPartnersService")
public class ChannelPartnersServiceImpl implements ChannelPartnersService {
	
	@Autowired
	private ChannelPartnersDao ChannelPartnersDao;

	@Override
	public List<ChannelPartners> getChannelPartnersList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.ChannelPartnersDao.getChannelPartnersList(map);
	}
	
	public int getChannelPartnersListCount(Map<String,Object> map){
		return this.ChannelPartnersDao.getChannelPartnersListCount(map);
	}

	@Override
	public void saveChannelPartner(ChannelPartners part) {
		// TODO Auto-generated method stub
		this.ChannelPartnersDao.saveChannelPartner(part);
	}

	@Override
	public void updateChannelPartner(ChannelPartners part) {
		// TODO Auto-generated method stub
		this.ChannelPartnersDao.updateChannelPartner(part);
	}

	@Override
	public void deleteChannelPartner(int partId) {
		// TODO Auto-generated method stub
		this.ChannelPartnersDao.deleteChannelPartner(partId);
	}

}
