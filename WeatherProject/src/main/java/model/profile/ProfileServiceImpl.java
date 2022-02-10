package model.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("profileService")
public class ProfileServiceImpl implements ProfileService{
	
	@Autowired
	private ProfileDAO profileDAO;

	@Override
	public ProfileVO Login(ProfileVO vo) {	
		try {
		return profileDAO.Login(vo);
		} catch(Exception e) {
			return null;
		}
	}

	@Override
	public boolean insertProfile(ProfileVO vo) {
		return profileDAO.insertProfile(vo);
	}

	@Override
	public void updateProfile(ProfileVO vo) {
		profileDAO.updateProfile(vo);
		
	}

	@Override
	public void deleteProfile(ProfileVO vo) {
		profileDAO.deleteProfile(vo);
	}
	
	
}
