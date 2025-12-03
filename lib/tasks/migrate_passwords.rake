namespace :users do
  desc "Migrate plain password -> password_digest (BCrypt). Skips users with no plain password or already migrated."
  task migrate_passwords: :environment do
    require 'bcrypt'
    migrated = 0
    skipped = 0

    User.find_each do |u|
      if u.password_digest.present?
        skipped += 1
        next
      end

      if u.respond_to?(:password) && u.password.present?
        # BCrypt でハッシュ化して保存（バリデーションを無視して強制保存）
        u.password_digest = BCrypt::Password.create(u.password)
        u.save!(validate: false)
        migrated += 1
        puts "migrated user id=#{u.id}"
      else
        skipped += 1
        puts "skipped user id=#{u.id} (no plain password)"
      end
    end

    puts "Done. migrated=#{migrated}, skipped=#{skipped}"
  end
end
