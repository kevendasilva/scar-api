json.extract! @door_lock, :id, :name, :open, :created_at, :updated_at
json.last_updates do
  json.array! @door_lock.updates.order(created_at: :desc).limit(@last_updates_limit)
end
