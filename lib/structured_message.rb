module StructuredMessage
  def self.dump id
    id_str = sprintf "%010d", id
    checksum = sprintf "%02d", generate_checksum(id)
    "+++#{id_str[0..2]}/#{id_str[3..6]}/#{id_str[7..9]}#{checksum}+++"
  end

  def self.load msg
    m = /(?:\+|\*){,3}(\d{3})\/?(\d{4})\/?(\d{3})(\d{2})(?:\+|\*){,3}/.match(msg)

    raise "invalid structured message: #{msg}" if m.nil?

    requested_id = (m[1] + m[2] + m[3]).to_i
    calculated_checksum = generate_checksum(requested_id)
    message_checksum = m[4].to_i

    raise "wrong structured message checksum in #{msg}: expected #{calculated_checksum}, got #{message_checksum}." if calculated_checksum != message_checksum

    requested_id
  end

  private
  def self.generate_checksum val
    mod = val % 97
    return mod == 0 ? 97 : mod
  end
end