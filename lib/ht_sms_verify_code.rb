require "ht_sms_verify_code/version"
require 'ht_sms'

module HtSmsVerifyCode

    def self.dispatch(phone, message)
        HtSMS.send_sms phone, message do |error|
            if error.nil?
                SMSVerifyCodes.create(phone: phone, message: message)
            end
        end
    end

    def self.check!(phone, code)
        vc = SMSVerifyCodes.where(phone: phone).order('created_at')[0]

        if vc.nil?
            err = '没有向这个手机号发送过验证码'
        elsif vc.created_at + vc.duration < Time.now
            err = '验证码已过期'
        elsif code.nil?
            err = '验证码不能为空'
        elsif vc.code != code
            err = '验证码不正确'
        elsif vc.used?
            err = '验证码已经被使用过了'
        else
            vc.used = true
            vc.save
            err = nil
        end
        return err.nil?, err
    end
end
