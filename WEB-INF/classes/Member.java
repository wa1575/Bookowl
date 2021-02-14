package beans;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String address;
	private String phone;
	private String sample6_postcode, sample6_detailAddress, sample6_address, sample6_extraAddress;
		
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getId() {
		return id;
	}
	public String getSample6_postcode() {
		return sample6_postcode;
	}
	public void setSample6_postcode(String sample6_postcode) {
		this.sample6_postcode = sample6_postcode;
	}
	public String getSample6_detailAddress() {
		return sample6_detailAddress;
	}
	public void setSample6_detailAddress(String sample6_detailAddress) {
		this.sample6_detailAddress = sample6_detailAddress;
	}
	public String getSample6_address() {
		return sample6_address;
	}
	public void setSample6_address(String sample6_address) {
		this.sample6_address = sample6_address;
	}
	public String getSample6_extraAddress() {
		return sample6_extraAddress;
	}
	public void setSample6_extraAddress(String sample6_extraAddress) {
		this.sample6_extraAddress = sample6_extraAddress;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress() {
		return sample6_postcode+""+sample6_detailAddress+sample6_address+sample6_extraAddress;
	}
	

	
}
