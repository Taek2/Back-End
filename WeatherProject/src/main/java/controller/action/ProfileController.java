package controller.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import model.profile.ProfileService;
import model.profile.ProfileVO;

@Controller
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, ProfileVO vo, Model model) {

		if(vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("���̵� ���鿡��!");
		}
		ProfileVO data = profileService.Login(vo);

		if(data != null) {
			HttpSession session=request.getSession();
			session.setAttribute("userInfo", data);
			return "redirect:index.jsp"; // VR�� ������ �����ϰ� redirect
		}
		else {
			// ���� �����ϰ� redirect�� �����ּ��� �� ǥ��
			model.addAttribute("errmsg", "���̵� ��й�ȣ�� Ȯ���ϼ���!");
			return "login.jsp";
		}
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index.jsp";
	}

	@RequestMapping("/join.do")
	public String join(ProfileVO vo) throws IllegalStateException, IOException{
		MultipartFile fileUpload=vo.getFileUpload();
		if(!fileUpload.isEmpty()) {
			// ������ ���� ��
			String fileName=fileUpload.getOriginalFilename();
			System.out.println("�����̸�: "+fileName);
			fileName = vo.getId() + "_profile.jpg";
			System.out.println("�ٲ� ���� �̸�: " + fileName);
			fileUpload.transferTo(new File("C:\\OH_7670\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\WeatherProject\\assets\\profileImage\\" + fileName));
			String path = "assets/profileImage/" + fileName;
			vo.setImage(path);	
		}
		else {
			// ������ ���� ���
			vo.setImage("assets/profileImage/defaultImage.jpg");
		}

		if(profileService.insertProfile(vo)) {
			return "redirect:index.jsp";
		}
		else {
			return "redirect:join.jsp";
		}

	}

	@RequestMapping("/updateProfile.do")
	public String updateProfile(ProfileVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartFile fileUpload=vo.getFileUpload();
		if(!fileUpload.isEmpty()) {
			// ������ ���� ��
			String fileName=fileUpload.getOriginalFilename();
			System.out.println("�����̸�: "+fileName);
			fileName = vo.getId() + "_profile.jpg";
			System.out.println("�ٲ� ���� �̸�: " + fileName);
			fileUpload.transferTo(new File("C:\\OH_7670\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\WeatherProject\\assets\\profileImage\\" + fileName));
			String path = "assets/profileImage/" + fileName;
			vo.setImage(path);	
		}
		else {
			// ������ ���� ���
			vo.setImage("assets/profileImage/defaultImage.jpg");
		}

		profileService.updateProfile(vo);
		HttpSession session=request.getSession();
		session.setAttribute("userInfo", vo);
		return "redirect:pages-profile.jsp";
	}

	@RequestMapping("/deleteProfile.do")
	public String deleteProfile(ProfileVO vo, HttpSession session) {
		profileService.deleteProfile(vo);	
		session.invalidate();
		return "redirect:index.jsp";
	}
}
