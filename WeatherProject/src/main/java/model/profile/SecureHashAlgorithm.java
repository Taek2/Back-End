package model.profile;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

@Service
public class SecureHashAlgorithm {
	public String run(String plainText, String Algorithms) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		
		//MessageDigest �ν��Ͻ� ����(MD5)
		MessageDigest md = MessageDigest.getInstance(Algorithms);
		
		//�ؽ��� ������Ʈ
		md.update(plainText.getBytes("utf-8"));
		
		//Byte To Base64 String
		return Base64.encodeBase64String(md.digest());
	}
}
