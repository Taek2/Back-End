package model.profile;

public interface ProfileService {
	ProfileVO Login(ProfileVO vo);
	boolean insertProfile(ProfileVO vo);
	void updateProfile(ProfileVO vo);
	void deleteProfile(ProfileVO vo);
}
