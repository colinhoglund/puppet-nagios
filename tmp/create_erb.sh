for i in $(cat centos-main-edit | sed 's/#//g' | cut -d = -f 1); do
echo "<% if @${i} -%>
${i}=<%= @${i} %>
<% end -%>"
done
