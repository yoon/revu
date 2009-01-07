ActionController::Routing::Routes.draw do |map|
  req = {:activity_type => /grant|publication|presentation|service/}
  get, put, pst, del = {:method => :get}, {:method => :put}, {:method => :post}, {:method => :delete}
  
  map.with_options :controller => 'activities' do |map|
    map.activities        '/activities/',                       :conditions => get,                       :action => "index"
    map.show_activity     '/:activity_type/:activity_id',       :conditions => get, :requirements => req, :action => "show"
    map.new_activity      '/:activity_type',                    :conditions => get, :requirements => req, :action => "new"
    map.create_activity   '/:activity_type',                    :conditions => pst, :requirements => req, :action => "create"
    map.edit_activity     '/:activity_type/:activity_id/edit',  :conditions => get, :requirements => req, :action => "edit"
    map.update_activity   '/:activity_type/:activity_id',       :conditions => put, :requirements => req, :action => "update"
    map.destroy_activity  '/:activity_type/:activity_id',       :conditions => del, :requirements => req, :action => "destroy"
  end
end
