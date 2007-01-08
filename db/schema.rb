# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 54) do

  create_table "announcements", :force => true do |t|
    t.column "headline", :string
    t.column "text", :text
    t.column "start", :datetime
    t.column "end", :datetime
    t.column "user_id", :integer
    t.column "text_html", :text
  end

  create_table "assignment_documents", :force => true do |t|
    t.column "assignment_id", :integer
    t.column "position", :integer
    t.column "filename", :string, :default => "", :null => false
    t.column "content_type", :string, :default => "", :null => false
    t.column "created_at", :datetime, :null => false
    t.column "extension", :string
    t.column "size", :string
  end

  create_table "assignment_pmd_settings", :force => true do |t|
    t.column "assignment_id", :integer
    t.column "style_check_id", :integer
    t.column "enabled", :boolean, :default => true, :null => false
  end

  create_table "assignments", :force => true do |t|
    t.column "course_id", :integer
    t.column "position", :integer
    t.column "title", :string
    t.column "open_date", :datetime
    t.column "due_date", :datetime
    t.column "close_date", :datetime
    t.column "description", :text
    t.column "description_html", :text
    t.column "file_uploads", :boolean, :default => false, :null => false
    t.column "enable_upload", :boolean, :default => false, :null => false
    t.column "enable_journal", :boolean, :default => true, :null => false
    t.column "programming", :boolean, :default => true, :null => false
    t.column "use_subversion", :boolean, :default => true, :null => false
    t.column "subversion_server", :string
    t.column "subversion_development_path", :string
    t.column "subversion_release_path", :string
    t.column "auto_grade", :boolean, :default => false, :null => false
    t.column "grade_category_id", :integer
    t.column "released", :boolean, :default => false, :null => false
  end

  create_table "auto_grade_settings", :id => false, :force => true do |t|
    t.column "assignment_id", :integer
    t.column "student_style", :boolean, :default => true, :null => false
    t.column "style", :boolean, :default => true, :null => false
    t.column "student_io_check", :boolean, :default => false, :null => false
    t.column "io_check", :boolean, :default => false, :null => false
    t.column "student_autograde", :boolean, :default => false, :null => false
    t.column "autograde", :boolean, :default => false, :null => false
  end

  add_index "auto_grade_settings", ["assignment_id"], :name => "auto_grade_settings_assignment_id_index", :unique => true

  create_table "basic_graders", :force => true do |t|
  end

  create_table "class_attendances", :force => true do |t|
    t.column "class_period_id", :integer, :default => 0, :null => false
    t.column "user_id", :integer, :default => 0, :null => false
    t.column "course_id", :integer, :default => 0, :null => false
    t.column "correct_key", :boolean, :default => true, :null => false
  end

  create_table "class_periods", :force => true do |t|
    t.column "course_id", :integer, :default => 0, :null => false
    t.column "open", :boolean, :default => true, :null => false
    t.column "key", :string, :default => "", :null => false
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
    t.column "position", :integer
  end

  create_table "comments", :force => true do |t|
    t.column "post_id", :integer, :default => 0, :null => false
    t.column "user_id", :integer, :default => 0, :null => false
    t.column "body", :text, :default => "", :null => false
    t.column "body_html", :text, :default => "", :null => false
    t.column "created_at", :datetime, :null => false
    t.column "ip", :string, :limit => 15, :default => "", :null => false
    t.column "course_id", :integer, :default => 0, :null => false
  end

  create_table "course_informations", :id => false, :force => true do |t|
    t.column "course_id", :integer
    t.column "meeting_days", :string
    t.column "meeting_time", :string
    t.column "office_hours", :string
    t.column "room", :string
  end

  add_index "course_informations", ["course_id"], :name => "course_informations_course_id_index", :unique => true

  create_table "course_settings", :id => false, :force => true do |t|
    t.column "course_id", :integer
    t.column "enable_blog", :boolean, :default => true, :null => false
    t.column "blog_comments", :boolean, :default => true, :null => false
    t.column "enable_gradebook", :boolean, :default => true, :null => false
    t.column "enable_documents", :boolean, :default => true, :null => false
    t.column "enable_prog_assignments", :boolean, :default => true, :null => false
    t.column "enable_svn", :boolean, :default => false, :null => false
    t.column "svn_server", :text
    t.column "enable_rss", :boolean, :default => true, :null => false
    t.column "ta_course_information", :boolean, :default => false, :null => false
    t.column "ta_course_documents", :boolean, :default => false, :null => false
    t.column "ta_course_assignments", :boolean, :default => false, :null => false
    t.column "ta_course_gradebook", :boolean, :default => false, :null => false
    t.column "ta_course_users", :boolean, :default => false, :null => false
    t.column "ta_course_blog_post", :boolean, :default => false, :null => false
    t.column "ta_course_blog_edit", :boolean, :default => false, :null => false
    t.column "ta_course_settings", :boolean, :default => false, :null => false
    t.column "ta_view_student_files", :boolean, :default => true, :null => false
    t.column "ta_grade_individual", :boolean, :default => true, :null => false
    t.column "ta_send_email", :boolean, :default => false, :null => false
    t.column "enable_forum", :boolean, :default => true, :null => false
    t.column "enable_forum_topic_create", :boolean, :default => false, :null => false
    t.column "enable_attendance", :boolean, :default => false, :null => false
  end

  add_index "course_settings", ["course_id"], :name => "course_settings_course_id_index", :unique => true

  create_table "courses", :force => true do |t|
    t.column "term_id", :integer, :default => 0, :null => false
    t.column "title", :string, :default => "", :null => false
    t.column "short_description", :string
    t.column "open", :boolean, :default => true, :null => false
    t.column "public", :boolean, :default => false, :null => false
  end

  create_table "courses_crns", :id => false, :force => true do |t|
    t.column "course_id", :integer, :default => 0, :null => false
    t.column "crn_id", :integer, :default => 0, :null => false
  end

  add_index "courses_crns", ["course_id", "crn_id"], :name => "courses_crns_course_id_index", :unique => true

  create_table "courses_users", :force => true do |t|
    t.column "user_id", :integer, :default => 0, :null => false
    t.column "course_id", :integer, :default => 0, :null => false
    t.column "course_student", :boolean, :default => true, :null => false
    t.column "course_instructor", :boolean, :default => false, :null => false
    t.column "course_guest", :boolean, :default => false, :null => false
    t.column "course_assistant", :boolean, :default => false, :null => false
  end

  add_index "courses_users", ["user_id", "course_id"], :name => "courses_users_user_id_index", :unique => true

  create_table "crns", :force => true do |t|
    t.column "crn", :string, :limit => 20, :default => "", :null => false
    t.column "name", :string, :default => "", :null => false
    t.column "title", :string
  end

  create_table "documents", :force => true do |t|
    t.column "course_id", :integer, :default => 0, :null => false
    t.column "position", :integer, :default => 0, :null => false
    t.column "title", :string, :default => "", :null => false
    t.column "filename", :string, :default => "", :null => false
    t.column "content_type", :string, :default => "", :null => false
    t.column "comments", :text
    t.column "comments_html", :text
    t.column "created_at", :datetime, :null => false
    t.column "extension", :string
    t.column "size", :string
    t.column "published", :boolean, :default => true, :null => false
    t.column "document_parent", :integer, :default => 0, :null => false
    t.column "folder", :boolean, :default => false, :null => false
  end

  create_table "file_comments", :force => true do |t|
    t.column "user_turnin_file_id", :integer, :default => 0, :null => false
    t.column "line_number", :integer, :default => 0, :null => false
    t.column "user_id", :integer, :default => 0, :null => false
    t.column "comments", :text
  end

  add_index "file_comments", ["user_turnin_file_id", "line_number"], :name => "file_comments_file_line_number_idx", :unique => true
  add_index "file_comments", ["user_turnin_file_id"], :name => "file_line_number_idx"

  create_table "file_styles", :force => true do |t|
    t.column "user_turnin_file_id", :integer, :default => 0, :null => false
    t.column "begin_line", :integer
    t.column "begin_column", :integer
    t.column "end_line", :integer
    t.column "end_column", :integer
    t.column "package", :string
    t.column "class_name", :string
    t.column "message", :text
    t.column "style_check_id", :integer
    t.column "suppressed", :boolean, :default => false, :null => false
  end

  add_index "file_styles", ["user_turnin_file_id"], :name => "file_line_number_idx"

  create_table "forum_posts", :force => true do |t|
    t.column "headline", :string, :default => "", :null => false
    t.column "post", :text, :default => "", :null => false
    t.column "post_html", :text, :default => "", :null => false
    t.column "forum_topic_id", :integer, :default => 0, :null => false
    t.column "parent_post", :integer, :default => 0, :null => false
    t.column "user_id", :integer, :default => 0, :null => false
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
    t.column "replies", :integer
    t.column "last_user_id", :integer
  end

  create_table "forum_topics", :force => true do |t|
    t.column "course_id", :integer, :default => 0, :null => false
    t.column "topic", :string, :default => "", :null => false
    t.column "position", :integer, :default => 0, :null => false
    t.column "allow_posts", :boolean, :default => true, :null => false
    t.column "user_id", :integer, :default => 0, :null => false
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
    t.column "post_count", :integer, :default => 0, :null => false
  end

  create_table "grade_categories", :force => true do |t|
    t.column "category", :string
    t.column "course_id", :integer, :default => 0, :null => false
  end

  create_table "grade_entries", :force => true do |t|
    t.column "grade_item_id", :integer
    t.column "user_id", :integer
    t.column "course_id", :integer
    t.column "points", :float
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "comment", :text
  end

  add_index "grade_entries", ["grade_item_id"], :name => "grade_entries_grade_item_id_index"
  add_index "grade_entries", ["user_id"], :name => "grade_entries_user_id_index"

  create_table "grade_items", :force => true do |t|
    t.column "name", :string
    t.column "date", :date
    t.column "points", :float
    t.column "display_type", :string, :limit => 1
    t.column "visible", :boolean, :default => true, :null => false
    t.column "grade_category_id", :integer
    t.column "assignment_id", :integer
    t.column "course_id", :integer, :default => 0, :null => false
  end

  create_table "grade_queues", :force => true do |t|
    t.column "user_id", :integer, :default => 0, :null => false
    t.column "assignment_id", :integer, :default => 0, :null => false
    t.column "user_turnin_id", :integer, :default => 0, :null => false
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
    t.column "serviced", :boolean, :default => false, :null => false
    t.column "acknowledged", :boolean, :default => false, :null => false
    t.column "queued", :boolean, :default => false, :null => false
    t.column "failed", :boolean, :default => false, :null => false
    t.column "message", :string
  end

  create_table "grade_weights", :force => true do |t|
    t.column "grade_category_id", :integer, :default => 0, :null => false
    t.column "percentage", :float, :default => 0.0, :null => false
    t.column "gradebook_id", :integer, :default => 0, :null => false
  end

  create_table "gradebooks", :id => false, :force => true do |t|
    t.column "course_id", :integer
    t.column "weight_grades", :boolean, :default => false, :null => false
    t.column "show_total", :boolean, :default => true, :null => false
  end

  add_index "gradebooks", ["course_id"], :name => "gradebooks_course_id_index", :unique => true

  create_table "journal_entry_stop_reasons", :id => false, :force => true do |t|
    t.column "journal_id", :integer
    t.column "journal_stop_reason_id", :integer
  end

  add_index "journal_entry_stop_reasons", ["journal_id", "journal_stop_reason_id"], :name => "journal_entry_stop_reasons_journal_id_index", :unique => true

  create_table "journal_entry_tasks", :id => false, :force => true do |t|
    t.column "journal_id", :integer
    t.column "journal_task_id", :integer
  end

  add_index "journal_entry_tasks", ["journal_id", "journal_task_id"], :name => "journal_entry_tasks_journal_id_index", :unique => true

  create_table "journal_fields", :id => false, :force => true do |t|
    t.column "assignment_id", :integer
    t.column "start_time", :boolean, :default => true, :null => false
    t.column "end_time", :boolean, :default => true, :null => false
    t.column "interruption_time", :boolean, :default => true, :null => false
    t.column "completed", :boolean, :default => true, :null => false
    t.column "task", :boolean, :default => true, :null => false
    t.column "reason_for_stopping", :boolean, :default => true, :null => false
    t.column "comments", :boolean, :default => true, :null => false
  end

  add_index "journal_fields", ["assignment_id"], :name => "journal_fields_assignment_id_index", :unique => true

  create_table "journal_stop_reasons", :force => true do |t|
    t.column "reason", :string
    t.column "course_id", :integer, :default => 0, :null => false
  end

  create_table "journal_tasks", :force => true do |t|
    t.column "task", :string
    t.column "course_id", :integer, :default => 0, :null => false
  end

  create_table "journals", :force => true do |t|
    t.column "assignment_id", :integer, :default => 0, :null => false
    t.column "user_id", :integer, :default => 0, :null => false
    t.column "start_time", :datetime
    t.column "end_time", :datetime
    t.column "interruption_time", :integer
    t.column "completed", :boolean
    t.column "comments", :text
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
  end

  create_table "posts", :force => true do |t|
    t.column "course_id", :integer, :default => 0, :null => false
    t.column "user_id", :integer, :default => 0, :null => false
    t.column "featured", :boolean, :default => false, :null => false
    t.column "title", :string, :default => "", :null => false
    t.column "body", :text, :default => "", :null => false
    t.column "body_html", :text, :default => "", :null => false
    t.column "enable_comments", :boolean, :default => true, :null => false
    t.column "created_at", :datetime, :null => false
    t.column "published", :boolean, :default => true, :null => false
  end

  create_table "programming_languages", :force => true do |t|
    t.column "name", :string
    t.column "enable_compile_step", :boolean, :default => true, :null => false
    t.column "compile_command", :string
    t.column "executable_name", :string
    t.column "execute_command", :string, :default => "", :null => false
    t.column "extension", :string, :default => "", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.column "session_id", :string
    t.column "data", :text
    t.column "updated_at", :datetime
  end

  add_index "sessions", ["session_id"], :name => "sessions_session_id_index"

  create_table "style_checks", :force => true do |t|
    t.column "name", :string
    t.column "description", :text
    t.column "example", :text
    t.column "bias", :boolean, :default => true, :null => false
  end

  add_index "style_checks", ["name"], :name => "style_checks_name_index", :unique => true

  create_table "temp_files", :force => true do |t|
    t.column "filename", :text
    t.column "save_until", :datetime
  end

  create_table "terms", :force => true do |t|
    t.column "term", :string, :limit => 10, :default => "", :null => false
    t.column "year", :integer, :default => 0, :null => false
    t.column "semester", :string, :limit => 15, :default => "", :null => false
    t.column "current", :boolean, :default => false
    t.column "open", :boolean, :default => true
  end

  create_table "user_turnin_files", :force => true do |t|
    t.column "user_turnin_id", :integer
    t.column "directory_entry", :boolean, :default => false, :null => false
    t.column "directory_parent", :integer, :default => 0, :null => false
    t.column "position", :integer, :default => 0, :null => false
    t.column "filename", :string, :default => "", :null => false
    t.column "created_at", :datetime, :null => false
    t.column "extension", :string
    t.column "main", :boolean, :default => false, :null => false
    t.column "main_candidate", :boolean, :default => false, :null => false
  end

  add_index "user_turnin_files", ["user_turnin_id", "filename", "directory_parent"], :name => "unique_filename_idx", :unique => true

  create_table "user_turnins", :force => true do |t|
    t.column "assignment_id", :integer
    t.column "user_id", :integer
    t.column "position", :integer
    t.column "sealed", :boolean, :default => false, :null => false
    t.column "created_at", :datetime, :null => false
    t.column "updated_at", :datetime, :null => false
    t.column "finalized", :boolean, :default => false, :null => false
  end

  create_table "users", :force => true do |t|
    t.column "uniqueid", :string, :limit => 15, :default => "", :null => false
    t.column "password", :string
    t.column "preferred_name", :string
    t.column "first_name", :string, :default => "", :null => false
    t.column "middle_name", :string
    t.column "last_name", :string, :default => "", :null => false
    t.column "instructor", :boolean, :default => false, :null => false
    t.column "admin", :boolean, :default => false, :null => false
    t.column "affiliation", :string
    t.column "personal_title", :string
    t.column "office_hours", :string
    t.column "phone_number", :string
    t.column "email", :string, :default => "", :null => false
  end

end
