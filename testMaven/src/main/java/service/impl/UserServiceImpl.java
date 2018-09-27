package service.impl;
 
import java.util.List;

import javax.annotation.Resource;
 
import org.springframework.stereotype.Service;
 
import dao.IUserDao;
import pgeUtil.PageBean;
import pojo.User;
import service.IUserService;
 
@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource  
    private IUserDao userDao;  
      
    public User getUserById(int userId) {  
        return this.userDao.selectByPrimaryKey(userId);
    }

	@Override
	public User checkLogin(String username, String password) {
		// TODO Auto-generated method stub
		return this.userDao.login(username, password);
	}
	
	@Override
	public int regist(String username,int password,int age) {
		// TODO Auto-generated method stub
		return this.userDao.addUser(username,password,age);
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		List<User> findAllList = userDao.findAll();  
        return findAllList;  
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return userDao.delete(id);
	}

	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		User user = userDao.findById(id); 
		return user;
	}

	@Override
	public List<User> findByUname(String username) {
		// TODO Auto-generated method stub
		List<User> user = userDao.findByUname(username);
		return user;
	}

	@Override
	public List<User> findByPage(String  name  ,int startIndex, int pageSize) {
		// TODO Auto-generated method stub
		List<User> user = userDao.findByPage(name,startIndex, pageSize);
		return user;
	}

	@Override
	public PageBean<User> findAllUserWithPage(int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		List<User> allUser = this.findAll();
		int totalRecord = allUser.size();
		PageBean pb = new PageBean(pageNum, pageSize, totalRecord);
		int startIndex = pb.getStartIndex();
//		pageSize = 5;
		pb.setList(this.findByPage("",startIndex, pageSize));
		return pb;
	}

	@Override
	public boolean update(int id, String username, String password) {
		// TODO Auto-generated method stub
		return userDao.update(id, username, password);
	}
}
