class NewKickstartMailer < ApplicationMailer

  default from: 'webadmin@kongocoaching.be'

  def new_registered_kickstart(client)
    @client = client
    @kickstart =@client.his_crew_as_client
    @crew = @client.his_crew_as_client
    @coordinator = @crew.owner
    mail to: @coordinator.email, subject: "Nouveau RDV pour un Kickstart!"
  end


end
