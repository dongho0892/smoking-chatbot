class KakaoController < ApplicationController
  def keyboard #json를 hash로,: =>,  :둘다가능

    @keyboard=
    {
      :type => "buttons",
      buttons: ["알리미 사용법", "흡연/금연구역보러가기", "흡연구역등록", "단속구역등록","문의하기", "공지사항"]
    }

    render json: @keyboard

  end
  
  def message
    @user_msg = params[:content]
    @text = "기본 텍스트"
    
    if @user_msg == "알리미 사용법"
      @text = "저희의 주요 서비스는 사용자의 위치를 중심으로 벌금이 부과되는 [금연구역] / 사용자들이 등록한 [흡연구역], [단속구역]을 지도로 확인 할 수 있도록 구현되어있습니다. 저희 서비스 이용시에는 GPS를 켜달라는 요청이 발생될 수 있으며, GPS 이용시에는 이용자 현재 위치를 중심으로 서비스가 제공될 수 있습니다. 서비스 이용 관련하여 자세한 내용은 아래 링크에 접속하시어 확인하시면 됩니다."
      @photo = ""
      @url = "https://no-smoking1-dongho0892.c9users.io/info"
    elsif @user_msg == "흡연/금연구역보러가기"
      @text = "현재 사용자의 위치를 중심으로 주변에 흡연 가능구역, 금연구역을 알려드립니다. GPS를 켜주시고, 아래 사이트에 접속해주세요."
      @photo = ""
      @url = "https://no-smoking1-dongho0892.c9users.io/"
    elsif @user_msg == "흡연구역등록"
      @text = "좋은 흡연 장소를 알고 계시면 아래 링크에 접속하여 흡연구역을 등록해주시면 감사드리겠습니다."
      @photo = ""
      @url = "https://no-smoking1-dongho0892.c9users.io/products/new"
    elsif @user_msg == "단속구역등록"
      @text = "흡연하다가 혹시 단속에 걸리셨나요? 다른 흡연자 분들을 위해 그 정보를 공유해주실 수 있나요? 아래 링크에 접속하여 흡연구역을 등록해주시면 감사드리겠습니다."
      @photo = ""
      @url = "https://no-smoking1-dongho0892.c9users.io/products/new_penalty"
    elsif @user_msg == "문의하기"
      @text = "궁금하신 사항은 아래 링크에 접속하시어, 관리자에게 문의해주세요."
      @photo = ""
      @url = "https://no-smoking1-dongho0892.c9users.io/qnas/new"
    elsif @user_msg == "공지사항"
      @text = "저희 서비스의 공지사항은 아래 링크를 통해 확인 가능힙니다."
      @photo = ""
      @url = "https://no-smoking1-dongho0892.c9users.io/notices"
    end
   
    @return_msg = {
      
    "text": @text,
    "photo": {
      "url": "http://k.kakaocdn.net/dn/9Py0f/btqnuIwanDT/ijQYm0tNJQbkwA3uskSnJ1/img_xl.jpg",
      "width": 640,
      "height": 480
      },
    "message_button": {
      "label": "사이트로 이동",
      "url": @url
      }

    }
    
   
    @return_keyboard = {
      :type => "buttons",
      buttons: ["알리미 사용법", "흡연/금연구역보러가기", "흡연구역등록", "단속구역등록","문의하기", "공지사항"]
    }
   

    @result = {
      :message => @return_msg,
      :keyboard => @return_keyboard
    }

   

    render json: @result
  end
end
