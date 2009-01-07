ActionController::Routing::Routes.draw do |map|
  get, put, pst, del = {:method => :get}, {:method => :put}, {:method => :post}, {:method => :delete}
  
  map.with_options :controller => 'activities' do |map|
    map.activities        '/',                                  :conditions => get, :action => "index"
    map.show_activity     '/:activity_type/:activity_id',       :conditions => get, :action => "show"
    map.new_activity      '/:activity_type',                    :conditions => get, :action => "new"
    map.create_activity   '/:activity_type',                    :conditions => pst, :action => "create"
    map.edit_activity     '/:activity_type/:activity_id/edit',  :conditions => get, :action => "edit"
    map.update_activity   '/:activity_type/:activity_id',       :conditions => put, :action => "update"
    map.destroy_activity  '/:activity_type/:activity_id',       :conditions => del, :action => "destroy"
  end
end
