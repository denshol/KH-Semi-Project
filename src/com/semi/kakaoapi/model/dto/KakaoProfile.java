package com.semi.kakaoapi.model.dto;

public class KakaoProfile {
	private String id;
	private KakaoAccount kakao_account;
	public KakaoProfile() {
		super();
		// TODO Auto-generated constructor stub
	}
	
		public KakaoProfile(String id, KakaoAccount kakao_account) {
		super();
		this.id = id;
		this.kakao_account = kakao_account;
	}
		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public KakaoAccount getKakao_account() {
			return kakao_account;
		}

		public void setKakao_account(KakaoAccount kakao_account) {
			this.kakao_account = kakao_account;
		}
		@Override
		public String toString() {
			return "KakaoProfile [id=" + id + ", kakao_account=" + kakao_account + "]";
		}





		//==========================================================================
		public class KakaoAccount{
			private Profile profile;
			private String email;
			private boolean has_email;
				public KakaoAccount() {
				super();
				
			}
				public KakaoAccount(Profile profile, String email, boolean has_email) {
					super();
					this.profile = profile;
					this.email = email;
					this.has_email = has_email;
				}
				public Profile getProfile() {
					return profile;
				}
				public void setProfile(Profile profile) {
					this.profile = profile;
				}
				public String getEmail() {
					return email;
				}
				public void setEmail(String email) {
					this.email = email;
				}
				public boolean isHas_email() {
					return has_email;
				}
				public void setHas_email(boolean has_email) {
					this.has_email = has_email;
				}
				@Override
				public String toString() {
					return "KakaoAccount [profile=" + profile + ", email=" + email + ", has_email=" + has_email + "]";
				}
//=============================================================
				public class Profile{
					private String nickname;
					private String profile_image_url;
					public Profile() {
						super();
						// TODO Auto-generated constructor stub
					}
					public Profile(String nickname, String profile_image_url) {
						super();
						this.nickname = nickname;
						this.profile_image_url = profile_image_url;
					}
					public String getNickname() {
						return nickname;
					}
					public void setNickname(String nickname) {
						this.nickname = nickname;
					}
					public String getProfile_image_url() {
						return profile_image_url;
					}
					public void setProfile_image_url(String profile_image_url) {
						this.profile_image_url = profile_image_url;
					}
					@Override
					public String toString() {
						return "Profile [nickname=" + nickname + ", profile_image_url=" + profile_image_url + "]";
					}
					
			}
		}
}
